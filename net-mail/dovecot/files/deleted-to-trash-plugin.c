/* Copyright (C) 2008 steven.xu@lba.ca */
#include "lib.h"
#include "array.h"
#include "str.h"
#include "str-sanitize.h"
#include "mail-storage-private.h"
#include "mailbox-list-private.h"
#include "deleted-to-trash-plugin.h"
#include <stdlib.h>


#define TRASH_NAME "Deleted Items"

#define DELETED_TO_TRASH_CONTEXT(obj) \
        MODULE_CONTEXT(obj, deleted_to_trash_storage_module)
/*      *((void **)array_idx_modifyable(&(obj)->module_contexts, \
                                        deleted_to_trash_storage_module_id))*/
#define DELETED_TO_TRASH_MAIL_CONTEXT(obj) \
        MODULE_CONTEXT(obj, deleted_to_trash_mail_module)

#define DELETED_TO_TRASH_LIST_CONTEXT(obj) \
        MODULE_CONTEXT(obj, deleted_to_trash_mailbox_list_module)


/* defined by imap, pop3, lda */
const char *deleted_to_trash_plugin_version = PACKAGE_VERSION;

static void (*deleted_to_trash_next_hook_mail_storage_created)
        (struct mail_storage *storage);

static void (*deleted_to_trash_next_hook_mailbox_list_created)
        (struct mailbox_list *list);

static MODULE_CONTEXT_DEFINE_INIT(deleted_to_trash_storage_module, 
                                  &mail_storage_module_register);
static MODULE_CONTEXT_DEFINE_INIT(deleted_to_trash_mail_module, &mail_module_register);
static MODULE_CONTEXT_DEFINE_INIT(deleted_to_trash_mailbox_list_module,
                                  &mailbox_list_module_register);


static void * last_copy_transaction_context = 0;
static unsigned int last_copy_mail_id[2000];
static unsigned int last_copy_mail_number=0;
static char *last_copy_src_mailbox_name = NULL;
static struct mailbox *trash_box = NULL; 

static int search_deleted_id(struct mail *_mail)
{
        unsigned int loop_count = 0;
        unsigned int deleted_id = _mail->uid;
        /*only it is under the same copy and delete box, the comparation is done, otherwise, need to reset last copy data 
        since copy always follows a delete in IMAP command(when move email from one folder to another folder)*/
        if(last_copy_src_mailbox_name != NULL && strcmp(_mail->box->name, last_copy_src_mailbox_name)==0)
        {
                for(loop_count = 0; loop_count < last_copy_mail_number; ++loop_count)
                {
                        if(last_copy_mail_id[loop_count] == deleted_id) 
                                return 1;
                }
        }
        else
        {
                last_copy_mail_number = 0;
                if(last_copy_src_mailbox_name != NULL)
                {
                        i_free(last_copy_src_mailbox_name);
                        last_copy_src_mailbox_name = NULL;

                }
        }
        return 0;
        
}

static int copy_deleted_mail_to_trash (struct mail *_mail)
{
        int ret;

        if(trash_box == NULL)
        {
            trash_box = mailbox_open(_mail->box->storage, TRASH_NAME, NULL, MAILBOX_OPEN_FAST | MAILBOX_OPEN_KEEP_RECENT | MAILBOX_OPEN_NO_INDEX_FILES);
                /* probably the mailbox just doesn't exist. try creating it. */
           if(trash_box == NULL)
           {
                        if (mail_storage_mailbox_create(_mail->box->storage, TRASH_NAME, FALSE) < 0)
                                i_fatal("failed to create Trash for delete operation");
                        else
                        {
                                i_info("successfully create Trash for delete operation");
                                trash_box = mailbox_open(_mail->box->storage, TRASH_NAME, NULL, MAILBOX_OPEN_FAST | MAILBOX_OPEN_KEEP_RECENT | MAILBOX_OPEN_NO_INDEX_FILES);
                                if(trash_box == NULL)
                                        i_fatal("failed to open Trash for delete operation");
                        }
           }
        }

        if(trash_box != NULL)
        {
                struct mailbox_transaction_context  *dest_trans;
                struct mail_keywords *keywords;
                const char *const *keywords_list;

                dest_trans = mailbox_transaction_begin(trash_box,
                                                MAILBOX_TRANSACTION_FLAG_EXTERNAL);

                keywords_list = mail_get_keywords(_mail);
                /*keywords = strarray_length(keywords_list) == 0 ? NULL :       mailbox_keywords_create(dest_trans, keywords_list);*/
                keywords = str_array_length(keywords_list) == 0 ? NULL :
                        mailbox_keywords_create_valid(trash_box, keywords_list);
        /*dovecot won't set delete flag at this moment*/
                ret = mailbox_copy(dest_trans, _mail, mail_get_flags(_mail),  keywords, NULL);

                mailbox_keywords_free(trash_box, &keywords);
        
                if (ret < 0)
                        mailbox_transaction_rollback(&dest_trans);
                else
                        ret = mailbox_transaction_commit(&dest_trans);
        }
        else
                ret = -1;
        
        return ret;
}

static void
deleted_to_trash_mail_update_flags(struct mail *_mail, enum modify_type modify_type,
                           enum mail_flags flags)
{
        struct mail_private *mail = (struct mail_private *)_mail;
        union mail_module_context *lmail = DELETED_TO_TRASH_MAIL_CONTEXT(mail);
        enum mail_flags old_flags, new_flags;

        old_flags = mail_get_flags(_mail);
        lmail->super.update_flags(_mail, modify_type, flags);

        new_flags = old_flags;
        switch (modify_type) {
        case MODIFY_ADD:
                new_flags |= flags;
                break;
        case MODIFY_REMOVE:
                new_flags &= ~flags;
                break;
        case MODIFY_REPLACE:
                new_flags = flags;
                break;
        }
        if (((old_flags ^ new_flags) & MAIL_DELETED) == 0)
                return ;
        /*marked as deleted, also not delete from Trash folder*/
        if( new_flags & MAIL_DELETED &&  strcmp(_mail->box->name, TRASH_NAME) != 0 )
        {
                if(search_deleted_id(_mail))
                {
                        i_info("email uid=%d just be copied",_mail->uid);
                }
                else
                {   
                        if (copy_deleted_mail_to_trash(_mail) < 0)
                                i_fatal("failed to copy %d to Trash",_mail->uid);
                }

        }
}

static struct mail *
deleted_to_trash_mail_alloc(struct mailbox_transaction_context *t,
                    enum mail_fetch_field wanted_fields,
                    struct mailbox_header_lookup_ctx *wanted_headers)
{
        union mailbox_module_context *lbox = DELETED_TO_TRASH_CONTEXT(t->box);
        union mail_module_context *lmail;
        struct mail *_mail;
        struct mail_private *mail;

        _mail = lbox->super.mail_alloc(t, wanted_fields, wanted_headers);
        mail = (struct mail_private *)_mail;

        lmail = p_new(mail->pool, union mail_module_context, 1);
        lmail->super = mail->v;

        mail->v.update_flags = deleted_to_trash_mail_update_flags;
        MODULE_CONTEXT_SET_SELF(mail, deleted_to_trash_mail_module, lmail);
        return _mail;
}

static int
deleted_to_trash_copy(struct mailbox_transaction_context *t, struct mail *mail,
              enum mail_flags flags, struct mail_keywords *keywords,
              struct mail *dest_mail)
{
        /*in one Copy command of IMAP, it can contains many mails ID, so, this function will be called multiple times*/
        union mailbox_module_context *lbox = DELETED_TO_TRASH_CONTEXT(t->box);
        if (lbox->super.copy(t, mail, flags, keywords, dest_mail) < 0)
                return -1;

   /*if copy transaction context changes, means it possible starts a new copy, so add additional conditions to check folder name*/
        if(last_copy_transaction_context == t && last_copy_src_mailbox_name != NULL && strcmp(last_copy_src_mailbox_name, mail->box->name) == 0)
        {
                if( last_copy_mail_number < sizeof(last_copy_mail_id)   ) 
                        last_copy_mail_id[last_copy_mail_number++] = mail->uid;
        }
        else 
        {   /*if copy from Trash to some other folder, we don't mark it */
                last_copy_transaction_context = t;
                last_copy_mail_number = 0;
                if (strcmp(mail->box->name, TRASH_NAME) != 0 )
                {
                        last_copy_mail_id[last_copy_mail_number++] = mail->uid;
                        last_copy_src_mailbox_name = i_strdup(mail->box->name);
                }
        }
        return 0;
}

static int
deleted_to_trash_transaction_commit(struct mailbox_transaction_context *t,
                            uint32_t *uid_validity_r,
                            uint32_t *first_saved_uid_r,
                            uint32_t *last_saved_uid_r)
{
        union mailbox_module_context *lbox = DELETED_TO_TRASH_CONTEXT(t->box);
        if (last_copy_transaction_context == t)
                last_copy_transaction_context = NULL;
        return lbox->super.transaction_commit(t, uid_validity_r,
                                              first_saved_uid_r,
                                              last_saved_uid_r);

}

static void
deleted_to_trash_transaction_rollback(struct mailbox_transaction_context *t)
{
        union mailbox_module_context *lbox = DELETED_TO_TRASH_CONTEXT(t->box);
        if (last_copy_transaction_context == t)
        {
                last_copy_transaction_context = NULL;
                last_copy_mail_number = 0;
        }
        lbox->super.transaction_rollback(t);
}

static struct mailbox *
deleted_to_trash_mailbox_open(struct mail_storage *storage, const char *name,
                      struct istream *input, enum mailbox_open_flags flags)
{
        union mail_storage_module_context *lstorage = DELETED_TO_TRASH_CONTEXT(storage);
        struct mailbox *box;
        union mailbox_module_context *lbox;
    
        box = lstorage->super.mailbox_open(storage, name, input, flags);
        if (box == NULL)
                return NULL;

        lbox = p_new(box->pool, union mailbox_module_context, 1);
        lbox->super = box->v;

        box->v.mail_alloc = deleted_to_trash_mail_alloc;
        box->v.copy = deleted_to_trash_copy;
        box->v.transaction_commit = deleted_to_trash_transaction_commit;
        box->v.transaction_rollback = deleted_to_trash_transaction_rollback;
        MODULE_CONTEXT_SET_SELF(box, deleted_to_trash_storage_module, lbox);
        return box;
}


static int
deleted_to_trash_mailbox_list_delete(struct mailbox_list *list, const char *name)
{
        union mailbox_list_module_context *llist = DELETED_TO_TRASH_LIST_CONTEXT(list);

        if (llist->super.delete_mailbox(list, name) < 0)
                return -1;

        /*reset flag in case of Trash deleted*/
        if(strcmp(name, TRASH_NAME) == 0)
                trash_box = NULL;
        return 0;
}

static void deleted_to_trash_mail_storage_created(struct mail_storage *storage)
{
        union mail_storage_module_context *lstorage;
        
        lstorage = p_new(storage->pool, union mail_storage_module_context, 1);
        lstorage->super = storage->v;
        storage->v.mailbox_open = deleted_to_trash_mailbox_open;

        MODULE_CONTEXT_SET_SELF(storage, deleted_to_trash_storage_module, lstorage);

        if (deleted_to_trash_next_hook_mail_storage_created != NULL)
                deleted_to_trash_next_hook_mail_storage_created(storage);
}

static void deleted_to_trash_mailbox_list_created(struct mailbox_list *list)
{
        union mailbox_list_module_context *llist;
        
        llist = p_new(list->pool, union mailbox_list_module_context, 1);
        llist->super = list->v;
        list->v.delete_mailbox = deleted_to_trash_mailbox_list_delete;
        
        MODULE_CONTEXT_SET_SELF(list, deleted_to_trash_mailbox_list_module, llist);

        if (deleted_to_trash_next_hook_mailbox_list_created != NULL)
                deleted_to_trash_next_hook_mailbox_list_created(list);
}
void deleted_to_trash_plugin_init(void)
{
        i_info("deleted_to_trash_plugin_init");
        deleted_to_trash_next_hook_mail_storage_created = hook_mail_storage_created;
        hook_mail_storage_created = deleted_to_trash_mail_storage_created;

        deleted_to_trash_next_hook_mailbox_list_created = hook_mailbox_list_created;
        hook_mailbox_list_created = deleted_to_trash_mailbox_list_created;
        
}

void deleted_to_trash_plugin_deinit(void)
{
        hook_mail_storage_created =     deleted_to_trash_next_hook_mail_storage_created;
        hook_mailbox_list_created = deleted_to_trash_next_hook_mailbox_list_created;
        
        if(trash_box != NULL)
                mailbox_close(&trash_box);
        if(last_copy_src_mailbox_name != NULL) 
                i_free(last_copy_src_mailbox_name);

}

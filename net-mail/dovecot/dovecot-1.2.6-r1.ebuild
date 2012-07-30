# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/net-mail/dovecot/dovecot-1.2.6.ebuild,v 1.1 2009/10/09 13:58:27 scarabeus Exp $

EAPI="2"

inherit eutils versionator

major_minor="$( get_version_component_range 1-2 )"
sieve_version="0.1.12"
managesieve_version="0.11.9"
SRC_URI="http://dovecot.org/releases/${major_minor}/${P}.tar.gz
	sieve? ( http://www.rename-it.nl/dovecot/${major_minor}/dovecot-${major_minor}-sieve-${sieve_version}.tar.gz )
	managesieve? (
		http://www.rename-it.nl/dovecot/${major_minor}/dovecot-${PV}-managesieve-${managesieve_version}.diff.gz
		http://www.rename-it.nl/dovecot/${major_minor}/dovecot-${major_minor}-managesieve-${managesieve_version}.tar.gz )
	deleted? ( http://wiki.dovecot.org/Plugins/deleted-to-trash?action=AttachFile&do=get&target=dovecot_deleted_to_trash-0.1.tar.gz
	)"
DESCRIPTION="An IMAP and POP3 server written with security primarily in mind"
HOMEPAGE="http://www.dovecot.org/"

SLOT="0"
LICENSE="LGPL-2.1" # MIT too?
KEYWORDS="~amd64 ~x86"

IUSE="berkdb bzip2 caps cydir dbox doc kerberos ldap +maildir managesieve mbox mysql pam postgres sieve sqlite +ssl suid vpopmail zlib deleted"

DEPEND="berkdb? ( sys-libs/db )
	caps? ( sys-libs/libcap )
	kerberos? ( virtual/krb5 )
	ldap? ( net-nds/openldap )
	mysql? ( virtual/mysql )
	pam? ( virtual/pam )
	postgres? ( virtual/postgresql-base )
	sqlite? ( dev-db/sqlite )
	ssl? ( dev-libs/openssl )
	vpopmail? ( net-mail/vpopmail )"

RDEPEND="${DEPEND}
	>=net-mail/mailbase-0.00-r8"

pkg_setup() {
	if use managesieve && ! use sieve; then
		eerror "managesieve USE flag selected but sieve USE flag unselected"
		die "USE flag problem"
	fi

	if use dbox && ! use maildir; then
		eerror "dbox USE flag needs maildir USE flag enabled"
		die "USE flag problem"
	fi

	# Add user and group for login process (same as for fedora/redhat)
	enewgroup dovecot 97
	enewuser dovecot 97 -1 /dev/null dovecot
	# add "mail" group for suid'ing. Better security isolation.
	if use suid; then
		enewgroup mail
	fi
}

src_prepare() {
	use managesieve && epatch "${WORKDIR}"/dovecot-${PV}-managesieve-${managesieve_version}.diff
}

src_unpack() {
	unpack ${A}
	use deleted && {
		unpack ${A}
		TRASH_DIR="${WORKDIR}/${P}/src/plugins/deleted-to-trash"
		mkdir ${TRASH_DIR}
		mv ${WORKDIR}/{deleted-to-trash-plugin.c,deleted-to-trash-plugin.h,Makefile} ${TRASH_DIR}
		}
}

src_configure() {
	local conf=""


	if use postgres || use mysql || use sqlite; then
		conf="${conf} --with-sql"
	fi

	local storages=""
	for storage in cydir dbox maildir mbox; do
		use ${storage} && storages="${storage} ${storages}"
	done
	[ "${storages}" ] || storages="maildir"

	econf \
		--sysconfdir=/etc/dovecot \
		--localstatedir=/var \
		--with-moduledir="/usr/$( get_libdir )/dovecot" \
		$( use_with berkdb db ) \
		$( use_with bzip2 bzlib ) \
		$( use_with caps libcap ) \
		$( use_with kerberos gssapi ) \
		$( use_with ldap ) \
		$( use_with mysql ) \
		$( use_with pam ) \
		$( use_with postgres pgsql ) \
		$( use_with sqlite ) \
		$( use_with ssl ) \
		$( use_with vpopmail ) \
		$( use_with zlib ) \
		$( use_with ldap) \
		--with-storages="${storages}" \
		--with-pic \
		--enable-header-install \
		${conf}

	if use sieve; then
		# The sieve plugin needs this file to be build to determine the plugin
		# directory and the list of libraries to link to.
		emake dovecot-config || die "emake dovecot-config failed"
		cd "../dovecot-${major_minor}-sieve-${sieve_version}"
		econf --with-dovecot="${S}"

		if use managesieve; then
			cd "../dovecot-${major_minor}-managesieve-${managesieve_version}"
			econf --with-dovecot="${S}" --with-dovecot-sieve="../dovecot-${major_minor}-sieve-${sieve_version}"
		fi
	fi

if use deleted; then
	cd "${WORKDIR}/${P}/src/plugins/deleted-to-trash"
	sed "8s|DOVECOT_IMAP_PLUGIN_PATH\ \=\ /usr/lib/dovecot/imap|DOVECOT_IMAP_PLUGIN_PATH\ \=\ \${D}/usr/lib64/dovecot/imap|" Makefile > Makefile.tmp
	mv Makefile.tmp Makefile
	fi

}

src_compile() {
	emake CC="$(tc-getCC)" CFLAGS="${CFLAGS}" || die "make failed"

	if use sieve; then
		cd "../dovecot-${major_minor}-sieve-${sieve_version}"
		emake CC="$(tc-getCC)" CFLAGS="${CFLAGS}" || die "make failed"

		if use managesieve; then
			cd "../dovecot-${major_minor}-managesieve-${managesieve_version}"
			emake CC="$(tc-getCC)" CFLAGS="${CFLAGS}" || die "make failed"
		fi
	fi

	if use deleted; then
		cd "${WORKDIR}/${P}/src/plugins/deleted-to-trash"
		make
		fi
}

src_install() {
	emake DESTDIR="${D}" install || die "make install failed"

	# insecure:
	#use suid && fperms u+s /usr/libexec/dovecot/deliver
	#better:
	if use suid;then
		einfo "Changing perms to allow deliver to be suided"
		fowners root:mail /usr/libexec/dovecot/deliver
		fperms 4750 /usr/libexec/dovecot/deliver
	fi

	rm -f "${D}"/etc/dovecot/dovecot-{ldap,sql}-example.conf

	newinitd "${FILESDIR}"/dovecot.init-r2 dovecot

	rm -rf "${D}"/usr/share/doc/dovecot

	if use doc; then
		dodoc AUTHORS NEWS README TODO dovecot-example.conf || die "basic dodoc failed"
		dodoc doc/* || die "dodoc doc/ failed"
		docinto wiki
		dodoc doc/wiki/* || die "dodoc doc/wiki/ failed"

	fi

	# Create the dovecot.conf file from the dovecot-example.conf file that
	# the dovecot folks nicely left for us....
	local conf="${D}/etc/dovecot/dovecot.conf"
	mv "${D}"/etc/dovecot/dovecot-example.conf "${D}"/etc/dovecot/dovecot.conf

	# .maildir is the Gentoo default, but we need to support mbox to
	local mail_location="maildir:~/.maildir"
	if use mbox; then
		mail_location="mbox:/var/spool/mail/%u:INDEX=/var/dovecot/%u"
		keepdir /var/dovecot
		sed -i -e 's|#mail_privileged_group =|mail_privileged_group = mail|' "${conf}"
	fi
	sed -i -e \
		"s|#mail_location =|mail_location = ${mail_location}|" "${conf}" \
		|| die "failed to update mail location settings in dovecot.conf"

	# We're using pam files (imap and pop3) provided by mailbase
	if use pam; then
		sed -i -e '/passdb pam/, /^[ \t]*}/ s|#args = dovecot|args = "\*"|' \
			"${conf}" || die "failed to update PAM settings in dovecot.conf"
		# mailbase does not provide a managesieve pam file
		use managesieve && dosym imap /etc/pam.d/managesieve
	fi

	# Listen on ipv6 and ipv4
	if use ipv6; then
		sed -i -e 's/^#listen = \*/listen = \[::\]/g' "${conf}" \
			|| die "failed to update listen settings in dovecot.conf"
	fi

	# Update ssl cert locations
	if use ssl; then
		sed -i -e 's,^#ssl_cert_file =.*,ssl_cert_file = /etc/ssl/dovecot/server.pem,' \
			-e 's,^#ssl_key_file =.*,ssl_key_file = /etc/ssl/dovecot/server.key,' \
			"${conf}" || die "failed to update SSL settings in dovecot.conf"
	fi

	# Install SQL configuration
	if use mysql || use postgres; then
		cp doc/dovecot-sql-example.conf "${D}"/etc/dovecot/dovecot-sql.conf
		fperms 600 /etc/dovecot/dovecot-sql.conf
		sed -i -e '/db sql/,/args/ s|=|= /etc/dovecot-sql.conf|' "${conf}" \
			|| die "failed to update SQL settings in dovecot-sql.conf"
		dodoc doc/dovecot-sql-example.conf
	fi

	# Install LDAP configuration
	if use ldap; then
		cp doc/dovecot-ldap-example.conf "${D}"/etc/dovecot/dovecot-ldap.conf
		fperms 600 /etc/dovecot/dovecot-ldap.conf
		sed -i -e '/db ldap/,/args/ s|=|= /etc/dovecot-ldap.conf|' "${conf}" \
			|| die "failed to update LDAP settings in dovecot-ldap.conf"
		dodoc doc/dovecot-ldap-example.conf
	fi

	if use sieve; then
		cd "../dovecot-${major_minor}-sieve-${sieve_version}"
		emake DESTDIR="${D}" install || die "make install failed (sieve)"

		if use managesieve; then
			cd "../dovecot-${major_minor}-managesieve-${managesieve_version}"
			emake DESTDIR="${D}" install || die "make install failed (managesieve)"
		fi
	fi

	if use deleted; then
		cd "${WORKDIR}/${P}/src/plugins/deleted-to-trash"
		emake install
		fi


	dodir /var/run/dovecot
	fowners root:root /var/run/dovecot
	fperms 0755 /var/run/dovecot
	keepdir /var/run/dovecot/login
	fowners root:dovecot /var/run/dovecot/login
	fperms 0750 /var/run/dovecot/login

	ewarn "If you are upgrading from Dovecot 1.1, read "
	ewarn " http://wiki.dovecot.org/Upgrading/1.2"
	if use sieve; then
		ewarn " http://wiki.dovecot.org/LDA/Sieve/Dovecot#Migration_from_CMUSieve"
		ewarn " In particular, do not forget to change cmusieve to sieve"
	fi
}

pkg_postinst() {
	if use deleted; then
		einfo "Add the deleted-to-trash plugin to your mail_plugins in /etc/dovecot/dovecot.conf:"
		einfo "mail_plugins = deleted_to_trash"
		fi
}

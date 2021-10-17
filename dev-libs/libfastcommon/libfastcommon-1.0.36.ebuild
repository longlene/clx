# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="c common functions library extracted from FastDFS"
HOMEPAGE="https://github.com/happyfish100/libfastcommon"
SRC_URI="https://github.com/happyfish100/libfastcommon/archive/V${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="LLGPL"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

src_compile() {
	./make.sh || die
}

src_install() {
	insinto /usr/include/fastcommon
	doins src/{common_define.h,hash.h,chain.h,logger.h,base64.h,shared_func.h,pthread_func.h,ini_file_reader.h,_os_define.h,sockopt.h,sched_thread.h,http_func.h,md5.h,local_ip_func.h,avl_tree.h,ioevent.h,ioevent_loop.h,fast_task_queue.h,fast_timer.h,process_ctrl.h,fast_mblock.h,connection_pool.h,fast_mpool.h,fast_allocator.h,fast_buffer.h,skiplist.h,multi_skiplist.h,flat_skiplist.h,skiplist_common.h,system_info.h,fast_blocked_queue.h,php7_ext_wrapper.h,id_generator.h,char_converter.h,char_convert_loader.h}
	dolib.so src/libfastcommon.so
	dodoc README
}

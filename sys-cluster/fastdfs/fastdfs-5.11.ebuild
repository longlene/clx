# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit user

DESCRIPTION="FastDFS is an open source high performance distributed file system (DFS)"
HOMEPAGE="https://github.com/happyfish100/fastdfs"
SRC_URI="https://github.com/happyfish100/fastdfs/archive/V${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND="
	dev-libs/libfastcommon
"
RDEPEND="${DEPEND}"

pkg_setup() {
	enewgroup fastdfs
	enewuser fastdfs -1 /bin/sh /var/lib/fastdfs fastdfs
}

src_prepare() {
	eapply_user
	sed -e "/base_path=/{s#/home/yuqing/fastdfs#/var/lib/fastdfs#}" \
		-e "/run_by_user=/{s#=#=fastdfs#}" \
		-e "/run_by_group=/{s#=#=fastdfs#}" \
		-i conf/tracker.conf || die
	sed -e "/base_path=/{s#/home/yuqing/fastdfs#/var/lib/fastdfs#}" \
		-e "/tracker_server=/{s#192.168.0.197#localhost#}" \
		-i conf/client.conf || die
	sed -e "/base_path=/{s#/home/yuqing/fastdfs#/var/lib/fastdfs#}" \
		-e "/tracker_server=/{s#192.168.0.197#localhost#}" \
		-e "/store_path0=/{s#/home/yuqing/fastdfs#/var/lib/fastdfs#}" \
		-e "/run_by_user=/{s#=#=fastdfs#}" \
		-e "/run_by_group=/{s#=#=fastdfs#}" \
		-i conf/storage.conf || die
	sed -e "/http.mime_types_filename=/{s#mime.types#/etc/mime.types#}" \
		-e "/http.anti_steal.token_check_fail=/{s#/home/yuqing/fastdfs/conf/anti-steal.jpg#/usr/share/doc/${P}/anti-steal.jpg#}" \
		-i conf/http.conf || die
}

src_compile() {
	./make.sh || die
}

src_install() {
	insinto /usr/include/fastdfs
	doins common/fdfs_define.h common/fdfs_global.h \
		common/mime_file_parser.h common/fdfs_http_shared.h \
		tracker/tracker_types.h tracker/tracker_proto.h \
		tracker/fdfs_shared_func.h \
		storage/trunk_mgr/trunk_shared.h \
		client/tracker_client.h client/storage_client.h client/storage_client1.h \
		client/client_func.h client/client_global.h client/fdfs_client.h
	dolib.so client/libfdfsclient.so
	dobin client/{fdfs_monitor,fdfs_test,fdfs_test1,fdfs_crc32,fdfs_upload_file,fdfs_download_file,fdfs_delete_file,fdfs_file_info,fdfs_appender_test,fdfs_appender_test1,fdfs_append_file,fdfs_upload_appender}
	dosbin storage/fdfs_storaged tracker/fdfs_trackerd
	insinto /etc/fdfs
	doins conf/{client.conf,http.conf,storage.conf,storage_ids.conf,tracker.conf}
	doinitd "${FILESDIR}"/fdfs_{storaged,trackerd}
	dodoc README.md conf/anti-steal.jpg
}

# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=5

inherit git-r3 cmake-utils

DESCRIPTION="A general purpose library for the OpenWRT project."
HOMEPAGE="http://wiki.openwrt.org/"
EGIT_REPO_URI="git://nbd.name/luci2/${PN}.git"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

COMMON_DEPEND="
	dev-libs/libubox[json]
	sys-apps/ubus
"
DEPEND="
	${COMMON_DEPEND}
"

src_prepare() {
	sed -i 's/-Werror //' CMakeLists.txt
	sed -i 's|\<json/json.h\>|json-c/json.h|' service/validate.c plug/hotplug.c
	sed -i 's/ -lgcc_pic//' upgrade/CMakeLists.txt
}

src_configure() {
	cmake-utils_src_configure
}

src_install() {
	cmake-utils_src_install

	install -d "${D}/etc/config"
}

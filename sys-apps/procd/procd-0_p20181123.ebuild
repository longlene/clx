# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=5

inherit cmake-utils vcs-snapshot

EGIT_COMMIT="d6673547adc3768ce674799fa35952351866c9d0"

DESCRIPTION="OpenWrt service/process manager"
HOMEPAGE="http://wiki.openwrt.org/"
SRC_URI="https://git.openwrt.org/?p=project/procd.git;a=snapshot;h=${EGIT_COMMIT};sf=tgz -> ${P}.tar.gz"

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

# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake vcs-snapshot

EGIT_COMMIT="8c852b656bf1622dee1ae2cfa4c083f730c1c539"

DESCRIPTION="OpenWrt ubus RPC backend server"
HOMEPAGE="http://wiki.openwrt.org/"
SRC_URI="https://git.openwrt.org/?p=project/rpcd.git;a=snapshot;h=${EGIT_COMMIT};sf=tgz -> ${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="file iwinfo"

COMMON_DEPEND="
	dev-libs/libubox[json]
	sys-apps/ubus
	sys-apps/uci
"
DEPEND="
	${COMMON_DEPEND}
"

src_prepare() {
	sed -i 's/-Werror //' CMakeLists.txt
	#sed -i 's|\<json/json.h\>|json-c/json.h|' service/validate.c plug/hotplug.c
}

src_configure() {
	local mycmakeargs=(
	$(cmake_use file FILE_SUPPORT)
	$(cmake_use iwinfo IWINFO_SUPPORT)
	)
	cmake_src_configure
}

#src_install # may need init.d

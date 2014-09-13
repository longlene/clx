# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=5

inherit git-2 cmake-utils

DESCRIPTION="OpenWrt ubus RPC backend server"
HOMEPAGE="http://wiki.openwrt.org/"
EGIT_REPO_URI="git://nbd.name/luci2/${PN}.git"

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
	$(cmake-utils_use file FILE_SUPPORT)
	$(cmake-utils_use iwinfo IWINFO_SUPPORT)
	)
	cmake-utils_src_configure
}

#src_install # may need init.d

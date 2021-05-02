# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cmake-utils vcs-snapshot

EGIT_COMMIT="89bfaa42460696fb3c37c232f69c2afd5c6d909e"

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
	$(cmake-utils_use file FILE_SUPPORT)
	$(cmake-utils_use iwinfo IWINFO_SUPPORT)
	)
	cmake-utils_src_configure
}

#src_install # may need init.d

# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit cmake-utils vcs-snapshot

EGIT_COMMIT="2e051f62899666805d477830ef790e1149bc6a89"

DESCRIPTION="OpenWrt system message/RPC bus"
HOMEPAGE="http://wiki.openwrt.org/"
SRC_URI="https://git.openwrt.org/?p=project/ubus.git;a=snapshot;h=${EGIT_COMMIT};sf=tgz -> ${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE="lua systemd examples"

DEPEND="
	systemd? ( sys-apps/systemd )
	lua? ( dev-lang/lua )
	dev-libs/libubox[json]
"

src_prepare() {
	default
	sed -i 's/-Werror //' CMakeLists.txt
	cmake-utils_src_prepare
}

src_configure() {
	local mycmakeargs=(
	$(cmake-utils_use_build lua LUA)
	$(cmake-utils_use_build examples EXAMPLES)
	$(cmake-utils_use_enable systemd SYSTEMD)
	)

	cmake-utils_src_configure
}

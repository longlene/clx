# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=5

inherit cmake-utils vcs-snapshot

EGIT_COMMIT="4c8b4d6efc8302b508d261573351fffb75bd98c2"

DESCRIPTION="OpenWrt Unified Configuration Interface"
HOMEPAGE="http://wiki.openwrt.org/"
SRC_URI="https://git.openwrt.org/?p=project/uci.git;a=snapshot;h=${EGIT_COMMIT};sf=tgz -> ${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE="lua"

DEPEND="
dev-libs/libubox
"

src_prepare() {
	default
	sed -i 's/-Werror //' CMakeLists.txt
}

src_configure() {
	local mycmakeargs=(
	$(cmake-utils_use_build lua LUA)
	)

	cmake-utils_src_configure
}

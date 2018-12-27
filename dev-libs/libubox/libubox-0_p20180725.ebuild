# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit cmake-utils vcs-snapshot

EGIT_COMMIT="c83a84afbef2b24f960ddeda0b5e2ab01fba6981"

DESCRIPTION="C utility functions for OpenWrt"
HOMEPAGE="http://wiki.openwrt.org/"
SRC_URI="https://git.openwrt.org/?p=project/libubox.git;a=snapshot;h=${EGIT_COMMIT};sf=tgz -> ${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE="example lua"

DEPEND="dev-libs/json-c"
RDEPEND="lua? ( dev-lang/lua )"

src_prepare() {
	eapply_user
	sed -i "s#LIBRARY DESTINATION lib#LIBRARY DESTINATION $(get_libdir)#" CMakeLists.txt
}

src_configure() {
	local mycmakeargs=(
		-DBUILD_LUA=$(usex lua)
		-DBUILD_EXAMPLES=$(usex example)
	)
	cmake-utils_src_configure
}

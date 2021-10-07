# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cmake-utils vcs-snapshot

DESCRIPTION=""
HOMEPAGE=""
SRC_URI="https://github.com/AmokHuginnsson/yaal/archive/refs/tags/release-${PV}.tar.gz -> ${P}.tar.gz"

LICENSE=""
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND="
	sys-libs/gpm

"
RDEPEND="${DEPEND}"
BDEPEND=""

CMAKE_BUILD_TYPE=release

src_prepare() {
	default
	sed -i "s#DESTINATION lib#DESTINATION $(get_libdir)#g" _aux/cmake/yaal.cmake
	cmake-utils_src_prepare
}

src_configure() {
	local mycmakeargs=(
		-DCURSES_NEED_NCURSES=ON
		-DCMAKE_INSTALL_LOCALSTATEDIR=/var
	)
	cmake-utils_src_configure
}


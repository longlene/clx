# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cmake lua vcs-snapshot

EGIT_COMMIT="85c9ec0fe452dca20cef3b4232c63e1032f47254"

DESCRIPTION="a fork of the Arcade Learning Environment"
HOMEPAGE="https://github.com/deepmind/xitari"
SRC_URI="https://github.com/deepmind/xitari/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="
	>=dev-lang/lua-5.1:=
	dev-lang/luajit:2
	sci-libs/torch7
"
RDEPEND="${DEPEND}"

src_configure() {
	local mycmakeargs=(
		"-DLUADIR=$(lua_get_sharedir)"
		"-DLIBDIR=$(lua_get_libdir)"
		"-DLUA_BINDIR=/usr/bin"
		"-DLUA_INCDIR=/usr/include"
		"-DLUA_LIBDIR=/usr/$(get_libdir)"
		"-DLUALIB=/usr/lib/libluajit-5.1.so"
		"-DLUA=/usr/bin/luajit"
	)

	cmake_src_configure
}

src_install() {
	dobin ${BUILD_DIR}/ale
	dolib.so ${BUILD_DIR}/libxitari.so
	insinto /usr/include/xitari
	doins ale_interface.hpp
	dodoc README.md
}

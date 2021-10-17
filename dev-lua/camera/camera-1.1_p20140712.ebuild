# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

LUA_COMPAT="luajit2"

inherit cmake lua vcs-snapshot

EGIT_COMMIT="6a202afe647a7a763f9d5c414ac2e0fd53e6b08a"

DESCRIPTION="A very simple camera interface (frame grabber) for Torch7"
HOMEPAGE="https://github.com/clementfarabet/lua---camera"
SRC_URI="https://github.com/clementfarabet/lua---camera/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="
	sci-libs/torch7
"
RDEPEND="${DEPEND}
	sci-libs/torch-xlua
	sci-libs/torch-sys
	sci-libs/torch-image
	media-libs/opencv
"

each_lua_configure() {
	local mycmakeargs=(
		"-DLUADIR=$(lua_get_lmoddir)"
		"-DLIBDIR=$(lua_get_cmoddir)"
		"-DLUA_BINDIR=/usr/bin"
		"-DLUA_INCDIR=/usr/include"
		"-DLUA_LIBDIR=/usr/$(get_libdir)"
		"-DLUALIB=/usr/lib/libluajit-5.1.so"
		"-DLUA=/usr/bin/luajit"
	)

	cmake_src_configure
}

each_lua_install() {
	cmake_src_install
	dodir $(lua_get_libdir) $(lua_get_sharedir)
	mv "${D}"/usr/lib/* "${D}"/$(lua_get_libdir)
	mv "${D}"/usr/lua/* "${D}"/$(lua_get_sharedir)
	rm -rf "${D}"/usr/lua
}



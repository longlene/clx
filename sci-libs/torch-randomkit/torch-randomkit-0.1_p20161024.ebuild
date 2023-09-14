# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake lua vcs-snapshot

EGIT_COMMIT="1bd264185272dc63b919d3050baaeeedc726c5eb"

DESCRIPTION="random number generators, wrapped for Torch"
HOMEPAGE="https://github.com/deepmind/torch-randomkit"
SRC_URI="https://github.com/deepmind/torch-randomkit/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="
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
	cmake_src_install
	dodir $(lua_get_sharedir) $(lua_get_libdir)
	mv "${D}"/usr/lib/* "${D}"$(lua_get_libdir)
	mv "${D}"/usr/lua/* "${D}"$(lua_get_sharedir)
	rm -rf "${D}"/usr/lua
}

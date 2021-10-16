# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=7

inherit cmake lua vcs-snapshot

EGIT_COMMIT="41308fe696bf8b0892f4ad4f9857d12a87a3f75e"

DESCRIPTION="Torch module for various Lua extensions."
HOMEPAGE="https://github.com/torch/xlua"
SRC_URI="https://github.com/torch/xlua/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="
	>=dev-lang/lua-5.1:=
	dev-lang/luajit:2
	sci-libs/torch7"
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
	dodir $(lua_get_sharedir)
	mv "${D}"/usr/lua/* "${D}"/usr/share/lua/5.1/
	rm -rf "${D}"/usr/lua
}

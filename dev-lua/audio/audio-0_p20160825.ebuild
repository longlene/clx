# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

LUA_COMPAT="luajit2"

inherit cmake lua vcs-snapshot

EGIT_COMMIT="d61eab4ffd9b3ef8218d367689236566e44e8f82"

DESCRIPTION="Module for torch to support audio I/O"
HOMEPAGE="https://github.com/soumith/lua---audio"
SRC_URI="https://github.com/soumith/lua---audio/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="RWTFPL"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="
	media-sound/sox
	sci-libs/torch7
	sci-libs/torch-sys
	sci-libs/torch-xlua
	sci-libs/fftw
"
RDEPEND="${DEPEND}"

each_lua_prepare() {
	default
	sed -i 's#/usr/include/sox/#/usr/include#' CMakeLists.txt
}

each_lua_configure() {
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

each_lua_install() {
	cmake_src_install
}

# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

LUA_COMPAT=( luajit )

inherit cmake lua-single vcs-snapshot

EGIT_COMMIT="4ebe222ba12589fb9d86c1d3895d7f509df77b6a"

DESCRIPTION="Paths manipulation library for Lua"
HOMEPAGE="https://github.com/torch/paths"
SRC_URI="https://github.com/torch/paths/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86"

REQUIRED_USE="${LUA_REQUIRED_USE}"

DEPEND="${LUA_DEPS}"
RDEPEND="${DEPEND}"
BDEPEND="virtual/pkgconfig"

src_configure() {
	local mycmakeargs=(
		"-DLUADIR=$(lua_get_lmod_dir)"
		"-DLIBDIR=$(lua_get_cmod_dir)"
		"-DLUA_BINDIR=/usr/bin"
		"-DLUA_INCDIR=$(lua_get_include_dir)"
		"-DLUA_LIBDIR=/usr/$(get_libdir)"
		"-DLUALIB=$(lua_get_shared_lib)"
		"-DLUA=${LUA}"
	)
	cmake_src_configure
}


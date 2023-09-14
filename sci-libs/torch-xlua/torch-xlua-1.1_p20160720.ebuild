# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

LUA_COMPAT=( luajit )

inherit cmake lua-single vcs-snapshot

EGIT_COMMIT="41308fe696bf8b0892f4ad4f9857d12a87a3f75e"

DESCRIPTION="Torch module for various Lua extensions"
HOMEPAGE="https://github.com/torch/xlua"
SRC_URI="https://github.com/torch/xlua/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="sci-libs/torch7"
RDEPEND="${DEPEND}"

src_configure() {
	local mycmakeargs=(
		"-DLUADIR=$(lua_get_lmod_dir)"
		"-DLIBDIR=$(lua_get_cmod_dir)"
		"-DLUA_BINDIR=/usr/bin"
		"-DLUA_INCDIR=$(lua_get_include_dir)"
		"-DLUA_LIBDIR=/usr/$(get_libdir)"
		"-DLUA=${LUA}"
	)

	cmake_src_configure
}


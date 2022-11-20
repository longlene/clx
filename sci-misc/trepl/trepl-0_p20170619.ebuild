# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

LUA_COMPAT=( luajit )

inherit cmake lua-single vcs-snapshot

EGIT_COMMIT="e5e17e3a56997123bd6c66cb8575175d3a6945bb"

DESCRIPTION="TREPL is a command-line REPL for Torch."
HOMEPAGE="https://github.com/torch/trepl"
SRC_URI="https://github.com/torch/trepl/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~arm"
IUSE=""

DEPEND="
	sys-libs/readline
	sci-libs/torch7
"
RDEPEND="${DEPEND}"

src_prepare() {
	default
	sed -e "/FIND_LIBRARY/{s#Readline#Readline readline#}" \
		-i CMakeLists.txt
	cmake_src_prepare
}

src_configure() {
	local mycmakeargs=(
		-DLUA_INCDIR=$(lua_get_include_dir)
		-DLUA_INCDIR=$(lua_get_include_dir)
		-DLUA_BINDIR=/usr/bin
		-DLUADIR=$(lua_get_lmod_dir)
		-DLUALIB=$(lua_get_shared_lib)
		-DLUA_LIBDIR=$(lua_get_cmod_dir)
	)
	cmake_src_configure
}

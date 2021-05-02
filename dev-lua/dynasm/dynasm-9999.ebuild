# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=7

inherit lua git-r3

DESCRIPTION="DynASM with Lua mode"
HOMEPAGE="http://luapower.com/dynasm"
SRC_URI=""

EGIT_REPO_URI="https://github.com/luapower/dynasm.git"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

src_compile() {
	if use amd64 ; then
		./csrc/dynasm/build-linux64.sh
	elif use x86 ; then
		./csrc/dynasm/build-linux32.sh
	fi
}

src_install() {
	if use amd64 ; then
		lua_install_cmodule bin/linux64/libdasm_x86.so
		lua_install_module dasm_x64.lua
	elif use x86 ; then
		lua_install_cmodule bin/linux32/libdasm_x86.so
		lua_install_module dasm_x86.lua
	fi
	lua_install_module dynasm.lua dasm.lua
}

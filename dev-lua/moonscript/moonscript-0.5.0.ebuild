# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit lua

DESCRIPTION="A programmer friendly language that compiles into Lua."
HOMEPAGE="https://github.com/leafo/moonscript"
SRC_URI="https://github.com/leafo/moonscript/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE="luajit +inotify"

RDEPEND="
	!luajit? ( >=dev-lang/lua-5.1 )
	luajit?  ( dev-lang/luajit:2 )
	dev-lua/lpeg
	dev-lua/luafilesystem
	dev-lua/alt-getopt
	inotify? ( dev-lua/linotify )
"
DEPEND="${RDEPEND}
	dev-util/pkgconfig
"

src_compile() {
	lua_version
	LUA=lua LUA_VERSION=${LUA_VER} emake compile
}

src_install() {
	dobin bin/moon bin/moonc
	lua_install_module -r moon moonscript
	dodoc README.md
}

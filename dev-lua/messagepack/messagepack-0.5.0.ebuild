# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit lua vcs-snapshot

DESCRIPTION="A pure Lua implementation of the MessagePack serialization format"
HOMEPAGE="http://fperrad.github.io/lua-MessagePack/"
SRC_URI="https://github.com/fperrad/lua-MessagePack/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE="+luajit"

RDEPEND="luajit? ( dev-lang/luajit:2 )
	!luajit? ( dev-lang/lua:= )"
DEPEND="${RDEPEND}"

src_compile() {
	:
}

src_install() {
	lua_install_module src/MessagePack.lua
	dodoc README.md
}

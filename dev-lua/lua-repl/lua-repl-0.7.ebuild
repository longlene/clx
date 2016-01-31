# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit lua

DESCRIPTION="A Lua REPL implemented in Lua for embedding in other programs"
HOMEPAGE="https://github.com/hoelzro/lua-repl/"
SRC_URI="mirror://github/hoelzro/lua-repl/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
|| ( dev-lua/lua-linenoise app-misc/rlwrap )
"

src_prepare() {
	mv rep.lua ${PN}
}

src_compile() {
	:
}

src_install() {
	lua_install_module -r repl
	dobin ${PN}
	dodoc README.md
}

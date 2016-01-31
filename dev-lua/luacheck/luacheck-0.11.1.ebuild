# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

inherit lua

DESCRIPTION="A tool for linting and static analysis of Lua code"
HOMEPAGE="https://github.com/mpeterv/luacheck"
SRC_URI="https://github.com/mpeterv/luacheck/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
dev-lua/luafilesystem
"

src_prepare() {
	mv bin/luacheck.lua bin/luacheck
}

src_install() {
	dobin bin/luacheck
	lua_install_module -r src/luacheck
	dodoc README.md
}

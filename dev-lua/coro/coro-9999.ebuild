# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit lua git-2

DESCRIPTION="Lua symmetric coroutines"
HOMEPAGE="http://luapower.com/coro"
SRC_URI=""

EGIT_REPO_URI="https://github.com/luapower/coro.git"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

src_install() {
	lua_instal_module coro.lua
}

# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=7

inherit lua git-r3

DESCRIPTION="A port of Ruby's Enumerable module to Lua"
HOMEPAGE="https://github.com/mikelovesrobots/lua-enumerable"
SRC_URI=""
EGIT_REPO_URI="https://github.com/mikelovesrobots/lua-enumerable.git"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

src_install() {
	lua_install_module lua-enumerable.lua
}

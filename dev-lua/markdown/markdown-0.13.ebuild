# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=8

inherit lua

DESCRIPTION="A pure-lua implementation of the Markdown text-to-html markup system"
HOMEPAGE="http://www.frykholm.se"
SRC_URI="http://files.luaforge.net/releases/markdown/markdown/markdown-0.13/markdown-${PV}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

src_install() {
	lua_install_module markdown.lua
}

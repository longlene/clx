# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

inherit lua git-2

DESCRIPTION="toml decoder/encoder"
HOMEPAGE="https://github.com/jonstoler/lua-toml"
SRC_URI=""

EGIT_REPO_URI="https://github.com/jonstoler/lua-toml.git"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

src_install() {
	lua_install_module toml.lua
	dodoc README.md
}

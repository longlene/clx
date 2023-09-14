# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit lua

DESCRIPTION="Lua wrapper for Mecab"
HOMEPAGE="https://github.com/polm/lua-mecab"
SRC_URI="https://github.com/polm/lua-mecab/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="WTFPL"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="
	dev-lang/lua:5.2
"
RDEPEND="${DEPEND}"

src_install() {
	lua_install_cmodule mecab.so
	dodoc README.md
}

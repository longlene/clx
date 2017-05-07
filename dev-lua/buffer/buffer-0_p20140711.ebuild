# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit lua vcs-snapshot

EGIT_COMMIT="bd95e6db11ffb5c96cdc2507e8dbc4b0d04d1bde"

DESCRIPTION="A buffer object for LuaJIT"
HOMEPAGE="https://github.com/clementfarabet/buffer"
SRC_URI="https://github.com/clementfarabet/buffer/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="Apache"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

src_install() {
	insinto $(lua_get_sharedir)/buffer
	doins init.lua
	dodoc README.md
}

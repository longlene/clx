# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit lua vcs-snapshot

DESCRIPTION="An extension of LPeg that supports labeled failures"
HOMEPAGE="https://github.com/sqmedeiros/lpeglabel"
SRC_URI="https://github.com/sqmedeiros/lpeglabel/archive/v${PV}-1.tar.gz -> ${P}.tar.gz"

LICENSE=""
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

src_install() {
	lua_install_cmodule ${PN}.so
	lua_install_module relabel.lua
	dodoc README.md
}

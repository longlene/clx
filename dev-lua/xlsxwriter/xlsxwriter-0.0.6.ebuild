# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=7

inherit lua

DESCRIPTION="A lua module for creating Excel XLSX files"
HOMEPAGE="https://github.com/jmcnamara/xlsxwriter.lua"
SRC_URI="https://github.com/jmcnamara/xlsxwriter.lua/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
dev-lua/zipwriter
"

S="${WORKDIR}"/${PN}.lua-${PV}

src_install() {
	lua_install_module -r xlsxwriter
	dodoc README.md
}

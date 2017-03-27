# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit lua

DESCRIPTION="Flexible CommonMark converter"
HOMEPAGE="https://github.com/jgm/lcmark"
SRC_URI="https://github.com/jgm/lcmark/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD-2"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lua/cmark
	dev-lua/yaml
	dev-lua/lpeg
	dev-lua/optparse
"

src_compile() {
	:
}

src_install() {
	lua_install_module lcmark.lua
	dobin bin/lcmark
	dodoc README.md
}
	

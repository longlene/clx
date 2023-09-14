# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit lua

DESCRIPTION="safe-template engine for lua"
HOMEPAGE="https://github.com/mascarenhas/cosmo"
SRC_URI="https://github.com/mascarenhas/cosmo/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE="doc"

DEPEND=""
RDEPEND="${DEPEND}"

src_configure() {
	:
}

src_install() {
	lua_install_module -r src/cosmo{,.lua}
	dodoc README
}

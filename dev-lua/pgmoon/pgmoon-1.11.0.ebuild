# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=7

inherit lua

DESCRIPTION="A pure Lua Postgres driver for use in OpenResty & more"
HOMEPAGE="https://github.com/leafo/pgmoon"
SRC_URI="https://github.com/leafo/pgmoon/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

src_compile() {
	:
}

src_install() {
	rm pgmoon/*.moon pgmoon/Tupfile
	lua_install_module -r pgmoon.lua pgmoon
	dodoc README.md
}

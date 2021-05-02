# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=7

inherit lua vcs-snapshot

MY_PV=${PV//./_}

DESCRIPTION="Copas is a dispatcher based on coroutines that can be used by TCP/IP servers"
HOMEPAGE="https://github.com/keplerproject/copas"
SRC_URI="https://github.com/keplerproject/copas/archive/v${MY_PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
dev-lua/luasocket
dev-lua/coxpcall
"

src_compile() {
	:
}

src_install() {
	lua_install_module -r src/*
	dodoc README
}

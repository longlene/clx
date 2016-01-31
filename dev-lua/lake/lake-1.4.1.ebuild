# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

DESCRIPTION="A Lua-based Build Tool"
HOMEPAGE="https://github.com/stevedonovan/Lake"
SRC_URI="https://github.com/stevedonovan/Lake/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
dev-lua/luafilesystem
"

S="${WORKDIR}"/Lake-${PV}

src_install() {
	dobin lake
	dodoc README.md
}

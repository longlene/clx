# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=7

DESCRIPTION="A C++11 Lua wrapper"
HOMEPAGE="https://github.com/Rapptz/sol"
SRC_URI="https://github.com/Rapptz/sol/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lang/lua
"

src_install() {
	insinto /usr/include
	doins -r sol sol.hpp
	dodoc README.md
}

# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

DESCRIPTION="a C++ <-> Lua API wrapper with advanced features and top notch performance"
HOMEPAGE="http://sol2.rtfd.io/"
SRC_URI="https://github.com/ThePhD/sol2/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	|| ( dev-lang/lua dev-lang/luajit )"

src_install() {
	insinto /usr/include
	doins -r sol{,.hpp}
	dodoc README.md
}

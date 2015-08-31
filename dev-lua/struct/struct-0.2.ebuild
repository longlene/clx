# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

inherit lua

DESCRIPTION="A library for converting Lua value to and from C struct"
HOMEPAGE="http://www.inf.puc-rio.br/~roberto/struct"
SRC_URI="http://www.inf.puc-rio.br/~roberto/struct/${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

S="${WORKDIR}"

src_install() {
	lua_install_cmodule struct.so
	dohtml struct.html
}

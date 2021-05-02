# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=7

inherit lua

MY_PV=${PV/_/-}
MY_P=${PN}-${MY_PV}

DESCRIPTION="General Purpose Scientific Computing in LuaJIT"
HOMEPAGE="http://scilua.org/sci.html"
SRC_URI="https://github.com/stepelu/lua-sci/archive/v${MY_PV}.tar.gz -> ${MY_P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
dev-lang/luajit
dev-lua/xsys
"

src_install() {
	insinto $(lua_get_sharedir)/sci
	doins -r alg dist fmin mcmc prng qrng quad root *.lua 
	dodoc README.md
}

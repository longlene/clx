# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

DESCRIPTION="A Parser Combinator library for C"
HOMEPAGE="https://github.com/orangeduck/mpc"
SRC_URI="https://github.com/orangeduck/mpc/archive/0.8.7.tar.gz -> ${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

src_compile() {
	$(tc-getCC) ${CFLAGS} ${LDFLAGS} -fPIC -shared -o lib${PN}.so -Wl,soname,lib${PN}.so ${PN}.c
}

src_install() {
	insinto /usr/include
	doins mpc.h
	dolib.so lib${PN}.so
	dodoc README.md
}

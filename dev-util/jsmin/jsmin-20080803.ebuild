# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=2

inherit toolchain-funcs

DESCRIPTION="A simple and lightweight JavaScript minifier"
HOMEPAGE="http://crockford.com/javascript/jsmin.html"
SRC_URI="ftp://ohnopub.net/mirror/${P}.c"
LICENSE="as-is"

SLOT="0"
KEYWORDS="~amd64 ~amd64-linux"
IUSE=""

S=${WORKDIR}

src_unpack() { :; }

src_compile() {
		$(tc-getCC) ${CFLAGS} ${CPPFLAGS} ${LDFLAGS} -o ${PN} "${DISTDIR}"/${P}.c || die
}

src_install() {
		dobin ${PN} || die
}

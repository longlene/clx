# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

DESCRIPTION="An optimizing interpreter for the Brainfuck programming language."
HOMEPAGE="http://brainwash.sourceforge.net/"
SRC_URI="mirror://sourceforge/${PN}/${P}.tar.bz2"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="char"

S="${WORKDIR}/${P}/src"

src_compile() {
	sed -i -e "s:CFLAGS =:CFLAGS = ${CFLAGS}:" Makefile || die "sed failed"

	if use char ; then
		emake char || die "emake failed"
	else
		emake || die "emake failed"
	fi
}

src_install() {
	dobin brainwash
	cd ..
	dodoc README ChangeLog
}

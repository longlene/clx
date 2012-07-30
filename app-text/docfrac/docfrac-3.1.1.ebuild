# Copyright 1999-2006 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit toolchain-funcs

DESCRIPTION="rtf/html/text conversion utility"
HOMEPAGE="http://docfrac.sourceforge.net/"
SRC_URI="mirror://sourceforge/${PN}/${P}.src.tar.gz"
LICENSE="LGPL-2.1"

SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND=""

src_unpack() {
	unpack ${A}
	cd "${S}"
	rm Makefile~
	sed -i -e "/CPPFLAGS=/s:-.*::" \
		-e "s:ar -:$(tc-getAR) -:" \
		-e "s:gcc -:$(tc-getCC) -:g" Makefile \
		|| die "sed failed in Makefile"
}

src_compile() {
	make docfrac || die "emake failed"
}

src_test() {
	make testhtml testtxt test || die "some tests failed"
}

src_install() {
	# manual install because Makefile doesn't respect DESTDIR
	dobin docfrac
	doman doc/docfrac.1
	dohtml -r doc/html40/*
}

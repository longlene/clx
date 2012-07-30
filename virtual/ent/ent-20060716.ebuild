# Copyright 1999-2007 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

DESCRIPTION="A pseudorandom number sequence test program"
HOMEPAGE="http://www.fourmilab.ch/random/"
SRC_URI="http://www.fourmilab.ch/random/random.zip"

LICENSE="public-domain"
SLOT="0"
KEYWORDS="~amd64"
IUSE="doc"

DEPEND="virtual/libc"

src_compile() {
	emake || die "make failed"
}

src_test() {
	emake test || die "test failed"
}

src_install() {
	dobin ent || die
	if use doc; then
		dohtml ent.html entitle.gif || \
			ewarn "Cannot install documentation"
	fi
}

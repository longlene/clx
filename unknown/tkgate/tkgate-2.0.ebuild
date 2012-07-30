# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit eutils

DESCRIPTION="A Tcl/Tk based digital circuit editor and simulator"
HOMEPAGE="http://www.tkgate.org"
SRC_URI="ftp://gadoid.ices.cmu.edu/pub/tkgate/pre-release/${P}-${V}b10.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86 ~amd64"

IUSE=""

DEPEND="=dev-lang/tcl-8*
		=dev-lang/tk-8*"

S=${WORKDIR}/${P}-${V}b10

src_unpack() {
	unpack ${A}
	cd ${S}
}

src_compile() {
	econf || die "econf failed"
	emake || die "emake failed"
}

src_install() {
	make DESTDIR=${D} install || die
}

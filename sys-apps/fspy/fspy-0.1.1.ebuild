# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit eutils

DESCRIPTION="Easy to use filesystem activity monitoring"
HOMEPAGE="http://mytty.org/fspy/"
SRC_URI="http://mytty.org/fspy/${P}.tar.bz2"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86"
IUSE=""

src_unpack() {
	unpack ${A}
	cd "${S}"
}

src_compile() {
	emake clean
	emake INSTBINDIR=$DESTDIR || die "emake failed"
}

src_install() {
	dobin fspy || die
	dodoc README LICENSE
}

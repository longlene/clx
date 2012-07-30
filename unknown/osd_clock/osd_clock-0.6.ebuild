# Copyright 1999-2004 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: 

inherit eutils

DESCRIPTION="an osd clock"
HOMEPAGE="http://leftorium.net/software/osd_clock/"
SRC_URI="http://leftorium.net/software/osd_clock/${P}.tar.gz"
LICENSE="GPL-2"

KEYWORDS="x86"
IUSE=""
DEPEND="x11-libs/xosd"

src_compile() {
	emake
}

src_install() {
	exeinto /usr/bin
	doexe osd_clock
	doman osd_clock.1
}

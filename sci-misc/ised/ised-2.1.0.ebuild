# Copyright 1999-2005 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

DESCRIPTION="ised is a command-line tool for generating number sequences and arithmetic evaluatio"
HOMEPAGE="http://ised.sourceforge.net"
SRC_URI="http://downloads.sourceforge.net/project/ised/${P}.tar.bz2"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86"
IUSE="float"

src_compile() {
	if use float; then
	econf FLOAT_TYPE=FLOAT
	fi
	if ! use float ; then
	econf FLOAT_TYPE=DOUBLE
	fi
}

src_install() {
	emake DESTDIR="${D}" install || die "install failed"
}


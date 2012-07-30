# Copyright 1999-2006 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit eutils

IUSE=""

RESTRICT=""
DESCRIPTION="xnecview is a program for visualizing the input and output of the nec antenna simulation software."
HOMEPAGE="http://wwwhome.cs.utwente.nl/~ptdeboer/ham/xnecview/"
SRC_URI="http://wwwhome.cs.utwente.nl/~ptdeboer/ham/xnecview/${PN}-${PV}.tgz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86"

DEPEND="media-libs/libpng
	=x11-libs/gtk+-1.2*"

src_unpack() {
	unpack ${A}
	cd ${S}
	epatch "${FILESDIR}/xnecview.c.diff"
}

src_install() {
	dobin xnecview || die "install binaries failed"
	dodoc COPYING HISTORY README || die "install doc failed"
	doman xnecview.1x
}

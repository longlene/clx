# Copyright 1999-2006 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit eutils

DESCRIPTION="The Log Writer Library (LWL) is a collection of routines for writing logs messages to files from C programms. It is a portable and re-entrant library fully written from scratch in pure ANSI C. It is designed to offer for C programmers common routines for logging messages in a highly customisable way."
SRC_URI="http://download.gna.org/lwl/${P}.tar.gz"
HOMEPAGE="http://home.gna.org/lwl/"

SLOT="0"
LICENSE="GPL-2"
KEYWORDS="x86"
IUSE=""

DEPEND=""
RDEPEND=""

src_unpack() {
	unpack ${A}
	cd "${S}"
}

src_compile() {

	econf || die
	emake || die
}



src_install() {
	emake DESTDIR="${D}" install || die
}

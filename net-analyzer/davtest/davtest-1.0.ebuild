# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3

DESCRIPTION="DAVTest tests WebDAV enabled servers"
HOMEPAGE="http://code.google.com/p/davtest/"
SRC_URI="http://${PN}.googlecode.com/files/${P}.tar.bz2"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~x86"
IUSE=""

DEPEND="perl-core/Getopt-Long
		dev-perl/HTTP-DAV"
RDEPEND="${DEPEND}"

src_install() {
	dobin davtest.pl

	for i in tests backdoors; do
		insinto /usr/share/${PN}/${i}
		doins ${i}/*
	done

	dodoc README.txt
}

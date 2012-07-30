# Copyright 1999-2005 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: 


DESCRIPTION="a shared library to access the contents of an iPod"
HOMEPAGE="http://www.gtkpod.org/libgpod.html"
SRC_URI="mirror://sourceforge/libitunesdb/${PN}_${PV}.tar.gz"

S="${WORKDIR}/${PN}_${PV}"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="alpha amd64 arm hppa ia64 mips ppc ppc64 sparc x86"
IUSE=""

RDEPEND=""

DEPEND=""

MAKEOPTS="-j1"

src_compile() {
	cd "${S}"

	econf || die "econf failed"
	emake || die "emake failed"
}

src_install() {
	make install DESTDIR=${D}
}

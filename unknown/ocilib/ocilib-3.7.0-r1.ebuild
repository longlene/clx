# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

DESCRIPTION="OCILIB is an open source and cross platform Oracle Driver that delivers access to Oracle databases"
SRC_URI="mirror://sourceforge/orclib/${P}-gnu.tar.gz"
HOMEPAGE="http://orclib.sourceforge.net/"
LICENSE="LGPL-2.1"
RDEPEND=">=dev-db/oracle-instantclient-basic-10.2.0.3-r1"
DEPEND="${RDEPEND}"
IUSE=""
KEYWORDS="amd64 x86"
SLOT=0



src_compile() {
	# should append CFLAGS, not replace them
	sed -i.orig -e 's/^CFLAGS = /CFLAGS += /g' src/Makefile.in
	econf || die "configure failed"
	emake || die "make failed"
}

src_install () {
	emake install DESTDIR="${D}" || die "emake install failed"
	dodoc AUTHORS ChangeLog README 
}

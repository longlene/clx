# Copyright 1999-2005 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

DESCRIPTION="A GUI front-end for Esetroot"
HOMEPAGE="http://gsetroot.sourceforge.net"
SRC_URI="mirror://sourceforge/${PN}/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86"
IUSE=""

DEPEND="x11-terms/eterm"
RDEPEND="virtual/x11
		${DEPEND}"

src_unpack() {
		unpack ${A}
		cd "${S}"
		
		# setting GFLAGS variable
		sed -i '54s#@CFLAGS@#${GFLAGS}#' src/Makefile.in
		
		# preventing INSTALL README & COPYING docs from being installed
		sed -i -e 's#${prefix}/doc/'${PN}'#${prefix}/share/doc/'${P}'#' \
-e 173,174d -e 177d Makefile.in
}

src_compile() {
		econf || die "configure failed."
		emake GFLAGS="${CFLAGS}" || die "make failed."
}

src_install() {
		make DESTDIR=${D} install || die "make failed."
}

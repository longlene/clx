# Copyright 1999-2005 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

DESCRIPTION="Open Source test tool and traffic generator for SIP"
HOMEPAGE="http://sipp.sourceforge.net/"
SRC_URI="mirror://sourceforge/${PN}/${PN}.${PV}.tar.gz"
LICENSE="GPL-2"
SLOT="0"

# More architectures than x86 could probably be supported. The author claims
# that SIPp can be run on HPUX, Tru64, RedHat, Debian, FreeBSD, Solaris/SunOS;
# see http://sipp.sourceforge.net/doc1.1/reference.html#Available+platforms
KEYWORDS="~x86 ~sparc"
IUSE=""
DEPEND=">=sys-libs/ncurses-5.4-r6"


src_unpack() {
	unpack $A
}


src_compile() {
	cd $WORKDIR/$PN && { make || die "build failed"; }
}


src_install() {
	dobin $WORKDIR/$PN/$PN || die "install failed"
	cd $WORKDIR/$PN && { dodoc LICENSE.txt README.txt || die "install of documentation failed"; }
}

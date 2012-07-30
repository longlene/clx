# Copyright 1999-2005 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

DESCRIPTION="Open Source test tool and traffic generator for SIP"
HOMEPAGE="http://sipp.sourceforge.net/"
SRC_URI="mirror://sourceforge/${PN}/${PN}.`echo $PV | tr -d '_'`.tar.gz"
LICENSE="GPL-2"
SLOT="0"

# More architectures than x86 could probably be supported. The author claims
# that SIPp can be run on HPUX, Tru64, RedHat, Debian, FreeBSD, Solaris/SunOS;
# see http://sipp.sourceforge.net/doc1.1/reference.html#Available+platforms
KEYWORDS="~x86 ~sparc"
IUSE=""
DEPEND=">=sys-libs/ncurses-5.4-r6 >=dev-libs/openssl-0.9.7e-r2"



src_unpack() {
	unpack $A
}


# To build without the Transport Layer Security and authentication features
# replace "make ossl" with "make all" below, and remove the openssl dependency.
src_compile() {
	cd $WORKDIR/$PN && { make ossl || die "build failed"; }
}


src_install() {
	dobin $WORKDIR/$PN/$PN || die "install failed"
	cd $WORKDIR/$PN && { dodoc LICENSE.txt README.txt || die "install of documentation failed"; }
}

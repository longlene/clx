# Copyright 1999-2007 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

DESCRIPTION="Serial-IO-Manager is a simple program to send and receive data from a serial interface."
HOMEPAGE="http://www.sourceforge.net/projects/serial-io/"
SRC_URI="mirror://sourceforge/serial-io/${P}.tar.bz2"

LICENSE="GPL2" 
SLOT="0"
KEYWORDS="~x86"
IUSE=""

DEPEND=">=x11-libs/qt-4.2"
RDEPEND=">=dev-libs/libserial-0.6.0_rc1
	${DEPEND}"

S="${WORKDIR}/serial-io"

src_compile(){
	emake || die "emake failed"
}

src_install() {
	emake INSTALL_ROOT=${D} install || die "emake install failed"
}





# Copyright 1999-2007 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

DESCRIPTION="LVProg - Linux Vinculum (USB host controller) Programmer"
HOMEPAGE="http://www.sourceforge.net/projects/lvprog/"
SRC_URI="mirror://sourceforge/lvprog/${P}.tar.bz2"

LICENSE="GPL2" 
SLOT="0"
KEYWORDS="~x86"
IUSE=""

DEPEND=">=x11-libs/qt-4.3
	>=dev-libs/libserial-0.5.2"
RDEPEND="${DEPEND}"

S="${WORKDIR}/LVProg"

src_compile(){
	qmake || die "qmake failed"
	emake || die "emake failed"
}

src_install() {
	emake INSTALL_ROOT=${D} install || die "emake install failed"
}

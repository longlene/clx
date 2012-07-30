# Copyright 1999-2007 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

DESCRIPTION="FarEditor is a program for creating and manipulating \
.far files for games Cytadela"
HOMEPAGE="http://cytadela.sf.net"
SRC_URI="mirror://sourceforge/cytadela/${P}.tar.bz2"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~x86"
IUSE=""

DEPEND="x11-libs/gtk+"
RDEPEND="${DEPEND}"

S="${WORKDIR}"/FarEditor

src_compile() {
	econf || die "econf failed"
	emake || die "emake failed"
}

src_install() {
	einstall || die "einstall failed"
	dodoc AUTHORS ChangeLog COPYING NEWS README TODO
}

# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit eutils base

DESCRIPTION="Robotics numerical optimization library"
HOMEPAGE="http://roboptim.sourceforge.net/"
SRC_URI="mirror://sourceforge/roboptim/${P}.tar.bz2"

LICENSE="LGPL-3"
SLOT="0"
KEYWORDS="~x86"
IUSE=""

DEPEND=">=dev-libs/boost-1.34.1 sys-devel/libtool app-doc/doxygen"
RDEPEND="${DEPEND}"

src_compile() {
        econf || die "econf failed"
	emake FLAGS="${CFLAGS}" || die "compile problem"
}

src_install() {
        emake DESTDIR="${D}" install || die "make install failed"
}

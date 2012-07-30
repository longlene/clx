# Copyright 1999-2006 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit eutils
LICENSE="GPL-2"
KEYWORDS="~x86 ~amd64"
DESCRIPTION="Application controlling multiple CD organizers via libcdorganizer"
SRC_URI="http://www.warfaresdl.com/~rich/${P}.tar.bz2"
HOMEPAGE="http://qcdorganizer.sourceforge.net"
IUSE=""

DEPEND="=x11-libs/qt-4*
		=dev-libs/libcdorganizer-1*"

src_compile()
{
	qmake || die "qmake failed"
	emake || die "emake failed"
}

src_install()
{
	mkdir -p ${D}/usr/bin
	cp ${S}/${PN}-release ${D}/usr/bin || die "install failed"
}

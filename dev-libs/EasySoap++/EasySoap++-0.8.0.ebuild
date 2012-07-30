# Copyright 1999-2005 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header$

inherit eutils

SRC_URI="mirror://sourceforge/easysoap/${P}.tar.gz"
DESCRIPTION="a C++ library for SOAP, the Simple Object Access Protocol"
HOMEPAGE="http://easysoap.sourceforge.net/"

LICENSE="LGPL-2.1"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="dev-libs/expat
		sys-devel/libtool"

RDEPEND="dev-libs/expat"

src_compile() {
	econf || die "configure failed"
	emake || die "make failed"
}

src_install() {
	emake DESTDIR=${D} install || die "make install failed"
	dodoc ChangeLog README AUTHORS NEWS TODO
}

# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

DESCRIPTION="Tool for low-level managing and monitoring of the parallel port"
HOMEPAGE="http://lptman.sourceforge.net/"
SRC_URI="mirror://sourceforge/lptman/${P}.tar.gz"

LICENSE="GPL"
SLOT="0"
KEYWORDS="~x86"
IUSE=""
DEPEND="=x11-libs/gtk+-2*\
	dev-util/pkgconfig\
	sys-devel/gettext"
RDEPEND="${DEPEND}"

src_install() {
    emake DESTDIR="${D}" install || die "install failed"
    dodoc README AUTHORS ChangeLog
}



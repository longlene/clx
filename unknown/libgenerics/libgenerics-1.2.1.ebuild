# Copyright 1999-2007 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit eutils

DESCRIPTION="C++ meta object runtime analyse and archiving"
HOMEPAGE="http://libgenerics.sourceforge.net/"
SRC_URI="mirror://sourceforge/${PN}/${P}.tar.gz"
LICENSE="GPL2"
SLOT="1.2"
KEYWORDS="~x86 ~amd64"
IUSE="doc"

RDEPEND="dev-libs/libxml2"
DEPEND="${RDEPEND}
	dev-util/pkgconfig"

DOCS="AUTHORS ChangeLog NEWS README"

src_compile () 
{
	econf $(use_enable doc)
	emake
}

src_install() {
	emake DESTDIR="${D}" install || die "Install failed"
	dodoc {$DOCS}
}

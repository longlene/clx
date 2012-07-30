# Copyright 1999-2007 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit eutils

DESCRIPTION="Gtk C++ object layer"
HOMEPAGE="http://libgenerics.sourceforge.net/"
SRC_URI="mirror://sourceforge/${PN}/${P}.tar.gz"
LICENSE="GPL2"
SLOT="1.2"
KEYWORDS="~x86 ~amd64"
IUSE="doc demo"

RDEPEND="dev-libs/libxml2
	 >=x11-libs/gtk+-2.10.0
	>=dev-libs/libgenerics-1.2.1"

DEPEND="${RDEPEND}
	dev-util/pkgconfig"

DOCS="AUTHORS ChangeLog NEWS README"

src_compile () 
{
	econf $(use_enable demo) $(use_enable doc)
	emake
}

src_install() {
	emake DESTDIR="${D}" install || die "Install failed"
	dodoc {$DOCS}
}

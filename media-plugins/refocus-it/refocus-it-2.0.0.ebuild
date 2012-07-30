# Copyright 1999-2005 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

IUSE=""
DESCRIPTION="Refocus-It plugin for The Gimp"
SRC_URI="mirror://sourceforge/refocus-it/${P}.tar.gz"
HOMEPAGE="http://refocus-it.sf.net/"

SLOT="0"
LICENSE="GPL"
KEYWORDS="~x86"

DEPEND=">=media-gfx/gimp-2.0.0
        >=x11-libs/gtk+-2.2.2"

src_compile() {
	econf --prefix=/usr || die
	emake || die
}

src_install() {

	make DESTDIR=${D} install || die
}

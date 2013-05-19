# Copyright 1999-2006 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: #

DESCRIPTION="Create, link and edit thoughts across a 2D canvas"
HOMEPAGE="http://donscorgie.pwp.blueyonder.co.uk/"
SRC_URI="http://donscorgie.pwp.blueyonder.co.uk/${P}.tar.bz2"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND="
	>=x11-libs/gtk+-2.8
	>=dev-python/pygtk-2.8
	>=dev-python/pygobject-2.10
	>=dev-python/gnome-python-2.12
	>=gnome-base/gnome-desktop-2.14
	>=dev-python/pycairo-1.0
"

src_compile() {
    econf || die "econf failed"
    emake || die "emake failed"
}

src_install() {
    make DESTDIR="${D}" install || die "install failed"
    
    dodoc NEWS README
}

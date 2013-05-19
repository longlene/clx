# Copyright 1999-2006 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

DESCRIPTION="Mind mapping tool for the GNOME desktop"
HOMEPAGE="http://www.gnome.org/~dscorgie/labyrinth.html"
SRC_URI="http://www.gnome.org/~dscorgie/labyrinth-${PV}.tar.bz2"

LICENCE="GPL-2"
KEYWORDS="~x86"
SLOT="0"
IUSE=""

DEPEND="virtual/python"
RDEPEND=">=x11-libs/gtk+-2.8.0
	>=dev-python/pygtk-2.8.0
	>=dev-python/pygobject-2.10
    >=dev-python/gnome-python-2.12
 	>=gnome-base/gnome-desktop-2.14
	>=dev-python/pycairo-1.0"

src_install() {
	make DESTDIR="${D}" install || die "Install failed!"
	dodoc NEWS README AUTHORS COPYING
}
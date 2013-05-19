# Copyright 1999-2006 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit gnome2

DESCRIPTION="Mind mapping tool for the GNOME desktop"
HOMEPAGE="http://www.gnome.org/~dscorgie/labyrinth.html"
SRC_URI="http://www.gnome.org/~dscorgie/files/${P}.tar.bz2"

LICENSE="GPL-2"
KEYWORDS="~x86 ~amd64"
SLOT="0"
IUSE=""

RDEPEND="virtual/python
	>=x11-libs/gtk+-2.8.0
	>=dev-python/pygtk-2.8.0
	>=dev-python/pygobject-2.10
	>=dev-python/gnome-python-2.12
	>=gnome-base/gnome-desktop-2.14
	>=dev-python/pycairo-1.0"

DEPEND="${RDEPEND}
	>=dev-util/intltool-0.35"

DOCS="AUTHORS Changelog NEWS README"

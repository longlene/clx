# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit gnome2

DESCRIPTION="Mind mapping tool for the GNOME desktop"
HOMEPAGE="http://code.google.com/p/labyrinth"
SRC_URI="http://labyrinth.googlecode.com/files/labyrinth_${PV}.tar.gz"

LICENSE="GPL-2"
KEYWORDS="~x86 ~amd64 ~ppc"
SLOT="0"
IUSE=""

RDEPEND="virtual/python
	>=x11-libs/gtk+-2.8.0
	>=dev-python/pygtk-2.8.0
	>=dev-python/pygobject-2.10
	>=dev-python/gnome-python-2.12
	>=gnome-base/gnome-desktop-2.14
	>=dev-python/pycairo-1.0
	>=dev-python/numeric-24"

DEPEND="${RDEPEND}
	>=dev-util/intltool-0.35"

DOCS="AUTHORS Changelog NEWS README"

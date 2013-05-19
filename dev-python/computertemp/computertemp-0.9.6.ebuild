# Copyright 1999-2005 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit gnome2

DESCRIPTION="An applet for GNOME 2 that shows CPU temperature"
SRC_URI="http://download.berlios.de/computertemp/${P}.tar.gz"
HOMEPAGE="http://computertemp.berlios.de"
LICENSE="GPL-2"

SLOT="0"
IUSE="doc"
KEYWORDS="~x86 ~amd64"

USE_DESTDIR="1"

DEPEND=">=dev-lang/python-2.4.0
   >=dev-python/pygtk-2.8
   >=dev-python/gnome-python-2.12
   >=dev-python/gnome-python-extras-2.12
   >=dev-python/gnome-python-desktop-2.14.0
   >=gnome-base/gconf-2.12"

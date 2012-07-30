# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="2"

inherit gnome2 python

DESCRIPTION="A countdown timer applet for the GNOME Panel"
HOMEPAGE="http://timerapplet.sourceforge.net/"
SRC_URI="mirror://sourceforge/timerapplet/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="doc"

DEPEND=""
RDEPEND="
	>=dev-lang/python-2.5
	>=dev-python/pygtk-2.10
	>=dev-python/gnome-python-2.16
	>=dev-python/gnome-python-desktop-2.16
	>=dev-python/notify-python-0.1
	>=dev-python/dbus-python-0.80
"

DOCS="AUTHORS ChangeLog NEWS README"

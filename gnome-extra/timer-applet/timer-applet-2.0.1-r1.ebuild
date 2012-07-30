# Copyright 1999-2007 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit gnome2 flag-o-matic python

DESCRIPTION="A countdown timer applet for the GNOME panel"
HOMEPAGE="http://timerapplet.sourceforge.net"
SRC_URI="mirror://sourceforge/timerapplet/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86"
IUSE="doc sounds libnotify dbus"

#notify-python takes libnotify too
RDEPEND=">=gnome-base/gnome-panel-2.6
	>=x11-libs/gtk+-2.8
	dev-libs/libxml2
	>=dev-python/pygtk-2.10
	|| ( >=dev-lang/python-2.5 dev-python/elementtree ) 
        dbus? ( 
                >=dev-python/dbus-python-0.71
                >=sys-apps/dbus-0.90 )
	sounds? ( gnome-extra/gnome-audio )
	libnotify? ( >=dev-python/notify-python-0.1.1 )"
DEPEND="${RDEPEND}
	>=dev-util/intltool-0.35.0"

DOCS="AUTHORS ChangeLog NEWS README"

src_compile() {
	append-flags $(xml2-config --cflags)
	gnome2_src_compile
}

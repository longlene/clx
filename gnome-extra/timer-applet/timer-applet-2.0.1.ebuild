# Copyright 1999-2007 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit gnome2 flag-o-matic

DESCRIPTION="Countdown timer applet for the GNOME panel"
HOMEPAGE="http://timerapplet.sourceforge.net"
SRC_URI="mirror://sourceforge/timerapplet/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86"
IUSE="doc"

# See http://timerapplet.sourceforge.net/documentation.php
RDEPEND=">=gnome-base/gnome-panel-2.6
	>=x11-libs/gtk+-2.8
	gnome-extra/gnome-audio
	dev-python/elementtree
	>=dev-python/notify-python-0.1.1
	>=dev-python/dbus-python-0.80.2"
DEPEND="${RDEPEND}
	>=dev-util/intltool-0.35.0"

DOCS="AUTHORS ChangeLog NEWS README"

src_compile() {
	append-flags $(xml2-config --cflags)
	gnome2_src_compile
}

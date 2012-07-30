# Copyright 1999-2004 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit gnome2

DESCRIPTION="A countdown timer applet for the GNOME panel"
HOMEPAGE="http://timerapplet.sourceforge.net"
SRC_URI="mirror://sourceforge/timerapplet/${PN}-${PV}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86"
IUSE="doc libnotify sound"

DEPEND=">=gnome-base/gnome-panel-2.6
	>=x11-libs/gtk+-2.8
	sound?(gnome-extra/gnome-audio)
	libnotify?(>=x11-libs/libnotify-0.3)"

RDEPEND="${DEPEND}"

DOCS="AUTHORS Changelog COPYING INSTALL NEWS README"


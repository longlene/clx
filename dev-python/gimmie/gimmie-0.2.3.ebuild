# Copyright 1999-2007 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/gnome-extra/gimmie/gimmie-0.2.2,v 1.8 2007/02/06 11:18:27 pacho Exp $

inherit gnome2

DESCRIPTION="Alternative menu applet for the GNOME panel"
HOMEPAGE="http://beatnik.infogami.com/Gimmie"
SRC_URI="http://www.beatniksoftware.com/gimmie/releases/gimmie-${PV}.tar.gz"

LICENSE="LGPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND=">=x11-libs/gtk+-2.6
	>=dev-python/pygtk-2.6
	>=dev-python/pygobject-2.6
	>=dev-python/gnome-python-2.10
	>=dev-python/gnome-python-desktop-2.10
	dev-python/gnome-python-extras
	net-libs/libgmail
	>=net-print/libgnomecups-0.2.2"

DEPEND="${RDEPEND}"

DOCS="AUTHORS ChangeLog NEWS README TODO"


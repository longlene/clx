# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="1"
GCONF_DEBUG="no"
SCROLLKEEPER_UPDATE="no"

inherit gnome2

DESCRIPTION="Engine providing live updates of online data to the desktop"
# no real homepage yet
HOMEPAGE="http://ftp.gnome.org/pub/GNOME/sources/desktop-data-model/"

LICENSE="LGPL-2.1"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="+sqlite"

RDEPEND=">=dev-libs/dbus-glib-0.6
	>=dev-libs/glib-2.6
	>=dev-libs/libpcre-6.3
	>=gnome-base/gnome-desktop-2.10
	>=net-libs/loudmouth-1.2.2
	>=sys-apps/dbus-1
	>=x11-libs/gtk+-2.6
	x11-libs/libXScrnSaver
	sqlite? ( >=dev-db/sqlite-3.3 )"

DEPEND="dev-util/pkgconfig
	>=gnome-base/gconf-2
	${RDEPEND}"

pkg_setup() {
	G2CONF="$(use_with sqlite)"
}

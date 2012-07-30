# Copyright 1999-2007 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit gnome2

DESCRIPTION="TV Guide for Gnome2 which uses xmltv as backend"
HOMEPAGE="http://gtvg.sourceforge.net/"
SRC_URI="mirror://sourceforge/gtvg/${P}.tar.gz"
LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86"
IUSE=""
DEPEND="dev-util/pkgconfig"
RDEPEND=">=x11-libs/gtk+-2.10
	>=gnome-base/libglade-2.6.0
	dev-libs/libxml2
	>=gnome-base/gconf-2.0
	x11-libs/libnotify
	sys-apps/dbus
	media-tv/xmltv"

src_unpack() {
	gnome2_src_unpack
	cd ${S}
}

src_install() {
	gnome2_src_install
}

pkg_postinst() {
	gnome2_gconf_install
}

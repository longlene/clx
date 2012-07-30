# Copyright 1999-2005 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit gnome2 eutils

DESCRIPTION="GNOME Clock applet with added Chinese lunar calendar support"
HOMEPAGE="http://packages.ubuntu.com/intrepid/lunar-applet"
SRC_URI="http://archive.ubuntu.com/ubuntu/pool/universe/l/${PN}/${PN}_${PV}.orig.tar.gz"
LICENSE="GPL-2"

IUSE=""
SLOT="0"
KEYWORDS="~x86 ~amd64"

RDEPEND=">=gnome-base/gconf-2.10.1
		>=dev-libs/atk-1.20.0
		>=dev-libs/glib-2.16.0
		>=x11-libs/gtk+-2.13.3
		>=x11-libs/pango-1.21.3
		>=gnome-base/libbonoboui-2.15.1
		>=x11-libs/liblunar-1.0.0"

DEPEND="${RDEPEND}"

DOCS="AUTHORS ChangeLog INSTALL NEWS README ABOUT-NLS TODO"

src_install() {
	gnome2_src_install
}

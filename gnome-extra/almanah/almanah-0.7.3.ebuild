# Copyright 2000-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v3

inherit eutils gnome2

DESCRIPTION="A personal diary for GNOME"
HOMEPAGE="http://live.gnome.org/Almanah_Diary"

SRC_URI="http://ftp.gnome.org/pub/GNOME/sources/almanah/0.7/${P}.tar.bz2"

LICENSE="GPL-3"

SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="spell crypt evolution"

RDEPEND=">=x11-libs/gtk+-2.14
	>=gnome-base/gconf-2
	spell? ( >=app-text/gtkspell-2 )
	crypt? ( >=app-crypt/gpgme-1 )
	>=dev-db/sqlite-3.0
	evolution? ( >=mail-client/evolution-2.30 )
	>=sys-apps/dbus-1.4"

DEPEND="${RDEPEND}
	>=dev-util/intltool-0.35
	>=dev-util/pkgconfig-0.9"

DOCS="AUTHORS ChangeLog COPYING NEWS README"
pkg_setup() {
	    G2CONF="${G2CONF}
		$(use_enable spell spell-checking)
		$(use_enable crypt encryption)
		"
}

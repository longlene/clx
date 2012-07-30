# Copyright 2000-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

inherit eutils gnome2

DESCRIPTION="A personal diary for GNOME"
HOMEPAGE="http://tecnocode.co.uk/projects/almanah/"

SRC_URI="http://tecnocode.co.uk/downloads/${P}.tar.gz"

LICENSE="LGPL-2.1"

SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="spell crypt"

RDEPEND=">=x11-libs/gtk+-2.14
	>=gnome-base/gconf-2
	spell? ( >=app-text/gtkspell-2 )
	crypt? ( >=app-crypt/gpgme-1 )
	>=dev-db/sqlite-3.0"

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

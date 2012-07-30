# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit versionator gnome2 eutils

MY_PVM=$(get_version_component_range 1-2)

DESCRIPTION="Browse your documents, ebooks and magazines and organize them with tags using Tracker"
HOMEPAGE="http://live.gnome.org/PaperBox"
SRC_URI="mirror://gnome/sources/${PN}/${MY_PVM}/${P}.tar.bz2"
LICENSE="GPL-2"

SLOT="0"
KEYWORDS="~x86"
IUSE="debug"

# we explicitly depend on glibmm-2.16 to ensure that giomm is
# available
RDEPEND=">=app-misc/tracker-0.6
	>=app-text/scrollkeeper-0.3.5
	>=dev-cpp/glibmm-2.16.0
	>=dev-cpp/gtkmm-2.12.0
	>=dev-cpp/gtkmm-utils-0.3.1
	>=dev-cpp/libglademm-2.6.0
	dev-libs/boost
	>=dev-libs/dbus-glib-0.50
	>=gnome-base/libgnomeui-2.16.0
	>=x11-libs/goocanvas-0.9"

DEPEND="sys-devel/gettext
	>=dev-util/intltool-0.35.0
	${RDEPEND}"

DOCS="AUTHORS ChangeLog NEWS README"

src_unpack() {
unpack ${A}
	cd "${S}"
	epatch "${FILESDIR}/${P}-stat.patch"
}


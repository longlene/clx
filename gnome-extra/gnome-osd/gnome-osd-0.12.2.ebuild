# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit gnome2 versionator

PV_MAJ=$(get_version_component_range 1-2)

DESCRIPTION="Gnome OSD notification system"
HOMEPAGE="https://launchpad.net/gnome-osd"
SRC_URI="https://launchpad.net/${PN}/${PV_MAJ}/${PV}/+download/${P}.tar.bz2"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="doc dbus"

RDEPEND=">=dev-lang/python-2.3
	 <=dev-lang/python-2.5.99
	>=dev-python/pygtk-2.4.0
	>=dev-python/gnome-python-2.6.0
	dbus? ( dev-python/dbus-python )"

DEPEND="${RDEPEND}
	>=dev-util/pkgconfig-0.9.0"

DOCS="AUTHORS ChangeLog NEWS README"

pkg_postinst() {
	gnome2_pkg_postinst

	# see the Installation section of the README
	kill -s HUP `pidof gconfd-2` > /dev/null 2>&1 || true
}

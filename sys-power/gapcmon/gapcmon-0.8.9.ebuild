# Copyright 1999-2006 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit base

DESCRIPTION="Gtk+-2 status monitor for APC UPSs managed by apcupsd"
HOMEPAGE="http://gapcmon.sourceforge.net/"
SRC_URI="http://downloads.sourceforge.net/${PN}/${P}.tar.bz2"
LICENSE="GPL-2"

SLOT="0"
KEYWORDS="~x86"
IUSE=""

DEPEND=">=sys-power/apcupsd-3.12
	>=x11-libs/gtk+-2.6
	>=dev-libs/glib-2.8
	>=gnome-base/gconf-2.10"

PATCHES="${FILESDIR}/gentoo-cosmetics-0.8.3.patch"

src_install() {
	emake DESTDIR="${D}" install || die "Install failed"
	dodoc AUTHORS ChangeLog NEWS README
}

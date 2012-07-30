# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/net-p2p/linkage/linkage-0.1.4.ebuild,v 1.6 2008/04/24 14:56:56 drac Exp $

SCROLLKEEPER_UPDATE=no
GCONF_DEBUG=no

inherit gnome2

DESCRIPTION="BitTorrent client written in C++ using gtkmm and libtorrent."
HOMEPAGE="http://code.google.com/p/linkage"
SRC_URI="http://${PN}.googlecode.com/files/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="gnome xfce"

RDEPEND="~net-libs/rb_libtorrent-0.13
	gnome-base/libgtop
	>=dev-cpp/gtkmm-2.10
	>=dev-cpp/gconfmm-2.6
	>=dev-cpp/libglademm-2.6
	>=x11-libs/libnotify-0.4.4
	dev-libs/dbus-c++
	gnome? ( >=dev-cpp/libgnomemm-2.16
		>=dev-cpp/gnome-vfsmm-2.16
		>=dev-cpp/libgnomeuimm-2.16 )
	xfce? ( >=xfce-extra/exo-0.3 )"
DEPEND="${RDEPEND}
	dev-util/pkgconfig
	sys-devel/gettext"

DOCS="README TODO"

pkg_setup() {
	G2CONF="${G2CONF} $(use_with gnome) $(use_with xfce exo)"
}

src_unpack() {
	unpack ${P}.tar.gz
}


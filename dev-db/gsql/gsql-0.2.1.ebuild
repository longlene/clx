# Copyright 1999-2004 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $
#
EAPI=4

inherit eutils gnome2

DESCRIPTION="Integrated database development tool for GNOME"
HOMEPAGE="http://gsql.org/"
SRC_URI="http://gsql.googlecode.com/files/${P}.tar.bz2"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE="gnome"

# FIXME: gmodule-2.0 may be required

DEPEND=">=x11-libs/gtk+-2.12
		>=gnome-base/gconf-2.0
		>=gnome-base/libglade-2.0
		>=x11-libs/libnotify-0.4
		>=x11-libs/gtksourceview-2.2
		x11-libs/vte
		gnome? (
			>=libgnome-2.0
			>=libgnomeui-2.0 )"

RDEPEND="${DEPEND}"

pkg_setup()
{
	G2CONF="${G2CONF}
		$(use_with gnome gnome)"

}


src_install()
{
	addpredict /etc/gconf/gconf.xml.defaults/.testing.writeability
	emake DESTDIR=${D} install || die "install failed"
}


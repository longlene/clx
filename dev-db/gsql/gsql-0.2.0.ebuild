# Copyright 1999-2004 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit eutils gnome2

DESCRIPTION="Integrated database development tool for GNOME"
HOMEPAGE="http://gsql.org/"
SRC_URI="http://gsql.googlecode.com/files/${PN}-${PV}.tar.bz2"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86 ~amd64"

DEPEND=">=x11-libs/gtk+-2.12
	>=x11-libs/gtksourceview-2.0
	>=x11-libs/libnotify-0.4
	"
RDEPEND="${DEPEND}"

src_install()
{
	addpredict /etc/gconf/gconf.xml.defaults/.testing.writeability
	emake DESTDIR=${D} install || die "install failed"
}
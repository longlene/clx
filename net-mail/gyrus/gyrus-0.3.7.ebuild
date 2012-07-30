# Copyright 1999-2004 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

DESCRIPTION="Gyrus: GNOME IMAP/Cyrus Administrator."
HOMEPAGE="http://http://www.gnome.org/projects/gyrus/"
SRC_URI="http://ftp.acc.umu.se/pub/GNOME/sources/gyrus/${PV%${PV/?.?/}}/${P}.tar.bz2"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86"
IUSE=""

RDEPEND=">=gnome-base/gconf-2.0.0
	>=x11-libs/gtk+-2.4.0
	>=gnome-base/libglade-2.0.0
	>=gnome-base/libgnomeui-2.6.0
	>=net-libs/gnet-2.0.0
	>=gnome-base/libgnomeprintui-2.10.0
	>=net-libs/gnutls-1.2.3"

DOCS="AUTHORS COPYING ChangeLog INSTALL NEWS README TODO"

src_compile() {
	econf || die "econf failed"
	emake || die "emake failed"
}

src_install() {
	dodoc ${DOCS}
	make DESTDIR=${D} install || die
}

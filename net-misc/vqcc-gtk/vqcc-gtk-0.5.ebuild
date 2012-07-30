# Copyright 1999-2006 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit eutils

DESCRIPTION="Vqcc-gtk - a chat application for the GTK+ toolkit, primarily used in small LAN's"
HOMEPAGE="http://vqcc-gtk.sourceforge.net"
SRC_URI="http://surfnet.dl.sourceforge.net/sourceforge/vqcc-gtk/${P}.tar.gz
		nls? ( http://admdenis.narod.ru/files/vqcc-gtk-0.5.1-shaman5.patch )"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE="startup-notification xscreensaver"

RDEPEND="=x11-libs/gtk+-2*
	   startup-notification? ( x11-libs/startup-notification )
	   xscreensaver? ( x11-misc/xscreensaver )"
DEPEND="${RDEPEND}
	   dev-util/pkgconfig"

src_unpack() {
		unpack ${P}.tar.gz
		myconf="--prefix=/usr"
		use xscreensaver || myconf="${myconf} --disable-xscreensaver"
		use startup-notification || myconf="${myconf} --disable-startup-notification"
}

src_install() {
		einstall || die
}

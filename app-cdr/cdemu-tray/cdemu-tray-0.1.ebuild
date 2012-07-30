# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header$

DESCRIPTION="A simple cdemu client written in c using dbus-glib and gtk+"
HOMEPAGE="http://desowin.org/cdemu-tray/"
SRC_URI="http://desowin.org/cdemu-tray/${P}.tar.bz2"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND="
	dev-libs/dbus-glib
	=x11-libs/gtk+-2*
	>=app-cdr/cdemud-1.0.0"

src_install() {
	exeinto ${BASE}/usr/bin
	doexe cdemu-tray
	dodoc AUTHORS COPYING README TODO
}

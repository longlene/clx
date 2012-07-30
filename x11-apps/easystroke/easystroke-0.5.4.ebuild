# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit eutils

DESCRIPTION="Easystroke is a gesture-recognition application for X11."
HOMEPAGE="http://easystroke.wiki.sourceforge.net/"
SRC_URI="mirror://sourceforge/${PN}/${P}.tar.gz"

LICENSE="ISC"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

DEPEND="dev-cpp/gtkmm
        x11-libs/libXrandr
		x11-apps/xinput
		x11-libs/libXtst
		dev-libs/boost
		dev-libs/dbus-glib
		dev-util/intltool"
RDEPEND="${DEPEND}"

src_compile() {
	sed -i "s/^LDFLAGS/#LDFLAGS/" Makefile || die "sed Makefile failed!"
	sed -i "s!^Icon=easystroke!Icon=/usr/share/icons/hicolor/scalable/apps/easystroke.svg!" easystroke.desktop.in || die "sed easystroke.desktop.in failed!"
	emake DESTDIR="${D}" PREFIX="/usr/" || die "emake failed!"
}

src_install() {
	emake DESTDIR="${D}" PREFIX="/usr" install || die "emake install failed!"
}

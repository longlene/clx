# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="2"

inherit eutils

DESCRIPTION="X-based boot splash"
HOMEPAGE="https://launchpad.net/xsplash"
SRC_URI="http://launchpad.net/xsplash/trunk/${PV}/+download/${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~x86"
IUSE=""

RDEPEND="dev-libs/dbus-glib
	sys-apps/dbus
	>=x11-libs/gtk+-2.20:2
	x11-libs/libX11
	x11-libs/libXcomposite
	"
DEPEND="${RDEPEND}
	dev-util/pkgconfig
	"

src_prepare() {
	epatch "${FILESDIR}"/${P}-deprecated-gtk_widget_realized.patch
}

src_install() {
	emake DESTDIR="${D}" install || die
	dodoc AUTHORS ChangeLog NEWS README TODO || die
}


# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="2"

DESCRIPTION="A traditional audio player with a GTK+ interface"
HOMEPAGE="http://eina.sourceforge.net"
SRC_URI="http://downloads.sourceforge.net/${PN}/${PN}-${PV}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~x86"
IUSE=""

RDEPEND="
	>=dev-db/sqlite-3.2
	>=dev-libs/dbus-glib-0.80
	>=dev-libs/glib-2.16
	>=dev-libs/libunique-1.0
	>=media-libs/gstreamer-0.10
	net-misc/curl
	sys-devel/gettext
	>=x11-libs/libnotify-0.4
	>=x11-libs/gtk+-2.14"
DEPEND="
	>=dev-util/pkgconfig-0.9
	${RDEPEND}"

src_configure() {
	econf --enable-release-build || die "configure failed"
}

src_compile() {
	emake CFLAGS="${CFLAGS}" LDFLAGS="${LDFLAGS}" || die "compile failed"
}

src_install() {
	emake DESTDIR="${D}" install || die "install failed"
	dodoc AUTHORS ChangeLog README NEWS || die "docs install failed" 
}

# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="2"

DESCRIPTION="A traditional audio player with a GTK+ interface"
HOMEPAGE="http://eina.sourceforge.net"
SRC_URI="http://launchpad.net/${PN}/trunk/${PV}/+download/${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="nls"

RDEPEND="dev-db/sqlite:3
	>=dev-libs/dbus-glib-0.80
	dev-libs/glib:2
	dev-libs/libunique
	media-libs/gstreamer
	net-misc/curl
	sys-devel/gettext
	virtual/libintl
	x11-libs/libnotify
	>=x11-libs/gtk+-2.14"
DEPEND="dev-util/pkgconfig
	nls? ( sys-devel/gettext )
	${RDEPEND}"

src_configure() {
	use nls || my_conf="--disable-nls"
	econf --enable-release-build ${my_conf}
}

src_compile() {
	emake CFLAGS="${CFLAGS}" LDFLAGS="${LDFLAGS}" || die
}

src_install() {
	emake DESTDIR="${D}" install || die
	dodoc AUTHORS ChangeLog README NEWS || die
}

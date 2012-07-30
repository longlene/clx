# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=2

inherit eutils

DESCRIPTION="Media Center app using (EFL) for the GUI and GeeXboX libs for playback and information retrieval"

HOMEPAGE="http://${PN}.geexbox.org/"

SRC_URI="${HOMEPAGE}/releases/${P}.tar.bz2"

LICENSE="LGPL-2.1"

SLOT="0"

KEYWORDS="~x86 ~amd64"

IUSE="+theme
	+bookstore +configuration +music +photo +video +weather
	+dvd
	+keyboard
	+hal +mtab
	+efreet +cddb +curl +xml +xrandr +lirc"

RDEPEND=">=x11-libs/elementary-0.6.0.063
	>=x11-libs/e_dbus-0.5.0.063
	>=media-libs/libplayer-1.0.0
	<media-libs/libplayer-1.1.0
	>=media-libs/libvalhalla-1.0.0
	<media-libs/libvalhalla-2.0.0
	efreet? ( dev-libs/efreet )
	curl? ( net-misc/curl )
	xml? ( dev-libs/libxml2 )
	xrandr? ( x11-libs/libXrandr )
	lirc? ( app-misc/lirc )"

DEPEND="${RDEPEND}"

#S="${WORKDIR}/${P}"

src_configure() {
	local conflibdir
	if [ "${ARCH}" = "amd64" ]; then
		conflibdir="--libdir=/usr/lib64"
	fi

	./configure \
		--prefix=/usr \
		--exec-prefix=/usr \
		--datarootdir=/usr/share \
		--datadir=/usr/share \
		--disable-static-modules \
		${conflibdir} \
		$(use_enable theme ) \
		$(use_enable bookstore activity-bookstore ) \
		$(use_enable configuration activity-configuration ) \
		--disable-activity-games \
		$(use_enable music activity-music ) \
		$(use_enable photo activity-photo ) \
		$(use_enable video activity-video ) \
		$(use_enable weather activity-weather ) \
		--disable-activity-tv \
		--disable-libsvdrp \
		--enable-browser-localfiles \
		--enable-browser-valhalla \
		--disable-browser-cdda \
		$(use_enable dvd browser-dvd ) \
		--disable-browser-netstreams \
		--disable-browser-podcasts \
		--disable-browser-shoutcast \
		--disable-browser-upnp \
		$(use_enable keyboard input-keyboard ) \
		$(use_enable hal volume-hal ) \
		$(use_enable mtab volume-mtab ) \
		$(use_enable efreet ) \
		--disable-libcddb \
		$(use_enable curl libcurl ) \
		$(use_enable xml libxml2 ) \
		$(use_enable xrandr libxrandr ) \
		|| die "./configure failed"
}

src_install() {
	emake install DESTDIR="${D}" || die "emake install failed"
	dodoc AUTHORS ChangeLog README TODO
}

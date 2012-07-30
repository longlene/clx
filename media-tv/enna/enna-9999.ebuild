# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=2

inherit eutils mercurial

DESCRIPTION="Media Center app using (EFL) for the GUI and GeeXboX libs for playback and information retrieval"

HOMEPAGE="http://${PN}.geexbox.org/"

#SRC_URI="${HOMEPAGE}/releases/${P}.tar.bz2"
: ${EHG_REPO_URI:=http://hg.geexbox.org/${PN}}

LICENSE="LGPL-2.1"

SLOT="0"

KEYWORDS=""

IUSE="+theme
	+bookstore +configuration +games +music +photo +vdr +video +weather
	+cdda +dvd +netstreams +podcast +shoutcast +upnp
	+keyboard
	+hal +mtab +udev
	+cddb +xrandr +lirc +ecore-x +libxdg-basedir"

RDEPEND=">=x11-libs/elementary-9999
	>=x11-libs/e_dbus-9999
	!vdr? ( >=media-libs/libplayer-2.0.0 )
	vdr? (	>=media-libs/libplayer-2.0.0[xine]
		media-libs/xine-lib[vdr] )
	>=media-libs/libvalhalla-2.0.0
	upnp? ( net-libs/gupnp-av )
	cddb? ( media-libs/libcddb )
	udev? ( sys-fs/udev )
	xrandr? ( x11-libs/libXrandr )
	lirc? ( app-misc/lirc )
	vdr? ( media-libs/libsvdrp
	libxdg-basedir? ( dev-libs/libxdg-basedir ) )"

# when they're released
#	<media-libs/libplayer-3.0.0
#	<media-libs/libvalhalla-3.0.0

DEPEND="${RDEPEND}"

S="${WORKDIR}/${PN}"

src_unpack() {
	mercurial_src_unpack
	cd "${S}"
}

src_configure() {
	local conflibdir
	if [ "${ARCH}" = "amd64" ]; then
		conflibdir="--libdir=/usr/lib64"
	fi

	./autogen.sh \
		--prefix=/usr \
		--exec-prefix=/usr \
		--datarootdir=/usr/share \
		--datadir=/usr/share \
		--disable-static-modules \
		${conflibdir} \
		$(use_enable theme ) \
		$(use_enable bookstore activity-bookstore ) \
		$(use_enable configuration activity-configuration ) \
		$(use_enable games activity-games ) \
		$(use_enable music activity-music ) \
		$(use_enable photo activity-photo ) \
		$(use_enable video activity-video ) \
		$(use_enable weather activity-weather ) \
		$(use_enable vdr activity-tv ) \
		$(use_enable vdr libsvdrp ) \
		--enable-browser-localfiles \
		--enable-browser-valhalla \
		$(use_enable cdda browser-cdda ) \
		$(use_enable dvd browser-dvd ) \
		$(use_enable netstreams browser-netstreams ) \
		$(use_enable podcast browser-podcasts ) \
		$(use_enable shoutcast browser-shoutcast ) \
		$(use_enable upnp browser-upnp ) \
		$(use_enable keyboard input-keyboard ) \
		$(use_enable hal volume-hal ) \
		$(use_enable mtab volume-mtab ) \
		$(use_enable udev volume-udev ) \
		$(use_enable cddb libcddb ) \
		$(use_enable xrandr libxrandr ) \
		$(use_enable ecore-x ) \
		$(use_enable libxdg-basedir ) \
		|| die "./configure failed"
}

src_install() {
	emake install DESTDIR="${D}" || die "emake install failed"
	dodoc AUTHORS ChangeLog README TODO
}

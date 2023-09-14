# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

inherit libtool

DESCRIPTION="SoundTracker is a music tracking tool for UNIX/X11 (MOD tracker)"
SRC_URI="http://www.soundtracker.org/dl/v0.6/${P/_/-}.tar.gz"
HOMEPAGE="http://www.soundtracker.org"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~alpha amd64 ~ppc sparc x86"
IUSE="gnome esd jack nls oss sdl"

RDEPEND=">=x11-libs/gtk+-2.16.5
	>=media-libs/audiofile-0.2.1
	media-libs/libsndfile
	esd? ( media-sound/esound )
	jack? ( media-sound/jack-audio-connection-kit )
	sdl? ( >=media-libs/libsdl-1.2 )
	nls? ( virtual/libintl )"
DEPEND="${RDEPEND}
	nls? ( sys-devel/gettext )
	dev-util/pkgconfig"

S=${WORKDIR}/${P/_/-}

src_unpack() {
	unpack ${A}
	cd "${S}"
	epatch "${FILESDIR}"/${P}-gtk2.patch

	rm -f config.cache
	elibtoolize
}

src_compile() {
	local myconf

	use oss || myconf="--disable-oss"
	use esd || myconf="${myconf} --disable-esd"
	use nls || myconf="${myconf} --disable-nls"
	use gnome || myconf="${myconf} --disable-gnome"
	use jack || myconf="${myconf} --disable-jack"
	use sdl || myconf="${myconf} --disable-sdl"

	# no support for recent alsa wrt 196636
	econf --disable-alsa ${myconf} || die "econf failed."
	emake || die "emake failed."
}

src_install () {
	einstall || die "einstall failed."

	fperms -s /usr/bin/${PN}

	dodoc AUTHORS ChangeLog* FAQ NEWS README TODO doc/*.txt
	dohtml -r doc

	doicon ${PN}_splash.png
	make_desktop_entry ${PN} SoundTracker ${PN}_splash
}

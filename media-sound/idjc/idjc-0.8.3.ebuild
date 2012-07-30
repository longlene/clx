# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header$

EAPI="2"

PYTHON_DEPEND="2"

inherit autotools python base

DESCRIPTION="A DJ console for ShoutCast/IceCast streaming"
HOMEPAGE="http://www.onlymeok.nildram.co.uk/"
SRC_URI="mirror://sourceforge/idjc/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="aac ffmpeg flac lame mp3 speex static-libs"

RDEPEND="dev-python/pygtk
	media-libs/libsamplerate
	media-libs/libshout
	media-libs/libsndfile
	media-libs/mutagen
	media-sound/jack-audio-connection-kit
	media-sound/vorbis-tools
	aac? ( media-libs/faad2 )
	ffmpeg? ( media-video/ffmpeg )
	flac? ( media-libs/flac )
	mp3? ( media-libs/libmad )
	lame? ( media-sound/lame )
	speex? ( media-libs/speex )"
DEPEND="${RDEPEND}
	>=dev-util/pkgconfig-0.9.0"

DOCS=( AUTHORS ChangeLog README NEWS )

pkg_setup() {
	python_set_active_version 2
}

src_prepare() {
	for x in $(find . -name "*.[ch]" -print0 | xargs -0 grep -l "#include <ffmpeg/avcodec.h>" ); do
		sed -i -e "/avcodec\.h/s:ffmpeg:libavcodec:" $x;
	done
	for x in $(find . -name "*.[ch]" -print0 | xargs -0 grep -l "#include <ffmpeg/avformat.h>"); do
		sed -i -e "/avformat\.h/s:ffmpeg:libavformat:" $x;
	done

	eautoreconf
}

src_configure() {
	econf \
		$(use_enable aac mp4) \
		$(use_enable ffmpeg) \
		$(use_enable mp3 mad) \
		$(use_enable lame) \
		$(use_enable speex) \
		$(use_enable static-libs static)
}

pkg_postinst() {
	einfo "In order to run idjc you first need to have a JACK sound server running."
	einfo "With all audio apps closed and sound servers on idle type the following:"
	einfo "jackd -d alsa -r 44100 -p 2048"
	einfo "Alternatively to have JACK start automatically when launching idjc:"
	einfo "echo \"/usr/bin/jackd -d alsa -r 44100 -p 2048\" >~/.jackdrc"
	einfo ""
	einfo "If you want to announce tracks playing in idjc to IRC using X-Chat,"
	einfo "copy or link /usr/share/idjc/idjc-announce.py to your ~/.xchat2/ dir."
}

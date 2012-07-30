# Copyright 2008 Håvard Wall (haavardw@ifi.uio.no)
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit libtool eutils autotools

DESCRIPTION="An Open Source implementation of the OpenMAX Integration Layer"
HOMEPAGE="http://omxil.sourceforge.net"
SRC_URI="http://downloads.sourceforge.net/omxil/libomxil-bellagio-${PV}.tar.gz"
S="${WORKDIR}/libomxil-bellagio-${PV}"

LICENSE="LGLP-2.1"
SLOT="0"
KEYWORDS="~amd64 ~ia64 ~x86 ~x86-fbsd"
IUSE="alsa fbcon ffmpeg mad vorbis"

RDEPEND="media-libs/alsa-lib
         mad? ( media-libs/libmad )
         vorbis? ( media-libs/libvorbis )
         ffmpeg? ( media-video/ffmpeg )"
DEPEND="${RDEPEND}
        sys-devel/autoconf
        sys-devel/automake"

src_unpack() {
	unpack ${A}
	cd ${S}
}

src_compile() {
	econf \
		$(use_enable alsa alsa) \
		$(use_enable fbcon fbvideosink) \
		$(use_enable ffmpeg ffmpegcomponents) \
		$(use_enable mad madcomponents) \
		$(use_enable vorbis vorbiscomponents)
	make
}

src_install() {
	make DESTDIR="${D}" install || die "make install failed"
}

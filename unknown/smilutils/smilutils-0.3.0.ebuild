# Copyright 1999-2004 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit eutils toolchain-funcs

DESCRIPTION="Kino utilities for video fx, fullscreen DV playback"
HOMEPAGE="http://www.kinodv.org/article/view/70/1/7"
SRC_URI="http://www.kinodv.org/filemanager/download/14/${P}.tar.gz"

RESTRICT="primaryuri"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86 ~amd64"

IUSE="ffmpeg imlib lame vorbis"
RDEPEND="
	>=media-libs/libdv-0.102
	dev-libs/libxml2
	media-libs/libsdl
	ffmpeg? ( media-video/ffmpeg )
	lame ( media-libs/lame )
	vorbis ( media-libs/libvorbis )
	imlib? ( media-libs/imlib )
	!imlib? ( media-libs/imlib2 )"

DEPEND="${RDEPEND}"

src_compile() {
	local myconf
	if use ffmpeg; then
		myconf="${myconf} $(use_with ffmpeg avcodec)"
	fi
	if use lame; then
		myconf="${myconf} --enable-mp3lame"
	fi
	if use imlib; then
		myconf="${myconf} $(use_with imlib)"
	fi
	if use vorbis; then
		myconf="${myconf} --enable-vorbis"
	fi
	CXXFLAGS="${CXXFLAGS} -fpermissive"
	econf \
		--disable-dependency-tracking \
		--disable-debug \
		${myconf} || die "configure failed"
	emake || die "make failed"
}

src_install() {
	einstall || die "Install failed"
}


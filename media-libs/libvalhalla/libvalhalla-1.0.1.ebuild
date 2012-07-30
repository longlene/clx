# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=2

inherit eutils

DESCRIPTION="Tiny media scanner / internet grabber library"

HOMEPAGE="http://${PN}.geexbox.org/"

SRC_URI="${HOMEPAGE}/releases/${P}.tar.bz2"

LICENSE="LGPL-2.1"

SLOT="0"

KEYWORDS="~x86 ~amd64"

IUSE="debug doc +curl +exif +gcrypt +nfo +xml"

RDEPEND="media-video/ffmpeg
	dev-db/sqlite:3
	curl? ( net-misc/curl )
	exif? ( media-libs/libexif )
	gcrypt? ( dev-libs/libgcrypt )
	nfo? ( media-libs/libnfo )
	xml? ( dev-libs/libxml2 )"

# add build-time dependencies
DEPEND="${RDEPEND}
	doc? ( app-doc/doxygen )"

#S="${WORKDIR}/${P}"

src_configure() {
	local conflibdir
	if [ "${ARCH}" = "amd64" ]; then
		conflibdir="--libdir=/usr/lib64"
	fi

	local dep_grabbers
	if use curl && use xml; then
		dep_grabbers=" \
			--enable-grabber-allocine \
			--enable-grabber-imdb \
			--enable-grabber-lastfm \
			--enable-grabber-lyricsfly \
			--enable-grabber-lyricwiki \
			--enable-grabber-tmdb \
			--enable-grabber-tvdb \
			--enable-grabber-tvrage"
		if use gcrypt; then
			dep_grabbers="${dep_grabbers} \
				--enable-grabber-amazon"
		fi
	fi
	if use debug; then
		dep_grabbers="${dep_grabbers} \
			--enable-grabber-dummy"
	fi
	if use exif; then
		dep_grabbers="${dep_grabbers} \
			--enable-grabber-exif"
	fi
	if use nfo; then
		dep_grabbers="${dep_grabbers} \
			--enable-grabber-nfo"
	fi

	./configure \
		--prefix=/usr \
		${conflibdir} \
		--disable-strip \
		$(use_enable debug ) \
		$(use_enable doc ) \
		--enable-grabber-ffmpeg \
		--enable-grabber-local \
		${dep_grabbers} \
		|| die "./configure failed"
}

src_install() {
	einstall DESTDIR="${D}" || die "einstall failed"
	dodoc AUTHORS ChangeLog README TODO
}

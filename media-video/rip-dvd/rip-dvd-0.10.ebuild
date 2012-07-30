# Copyright 1999-2007 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit eutils

DESCRIPTION="Rip and encode DVD's or video"
HOMEPAGE="http://software.kallenberg.dk/rip-dvd/"
SRC_URI="http://software.kallenberg.dk/rip-dvd/${P}.tar.bz2"

LICENSE="GPL"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

# need to find out how to not depend on faac-1.26-r1
RDEPEND="media-video/ffmpeg media-video/mplayer media-video/transcode
!=medie-libs/faac-1.26-r1"

src_compile() {
	:;
}

src_install() {
	dobin rip-dvd
	fperms 0755 /usr/bin/rip-dvd
	doman rip-dvd.1
}

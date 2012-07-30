# Copyright 1999-2005 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit eutils

DESCRIPTION="frontend for normalize and various audio encoders"
HOMEPAGE="http://gnormalize.sourceforge.net/"
SRC_URI="mirror://sourceforge/gnormalize/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86 ~amd64"

IUSE="aac cddb flac mp3 musepack oggvorbis"
DEPEND="dev-perl/gtk2-perl
	media-sound/normalize
	media-sound/cdparanoia
        dev-perl/MP3-Info
        media-sound/cdcd
	mp3? ( media-sound/lame )	
	aac? ( media-libs/faac
		media-libs/faad2 )
	musepack? ( media-sound/musepack-tools )
	flac? ( >=media-libs/flac-1.1.1 )
	oggvorbis? ( media-sound/vorbis-tools )
	cddb? ( dev-perl/CDDB_get )"
	
src_install() {
	dobin "${S}"/gnormalize
	doicon "${S}"/gnormalize.png
	dodoc README
	insinto /usr/share/"${PN}"/animations/
	doins "${S}"/animations/*.gif
}

# Copyright 1999-2006 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

DESCRIPTION="GTK-2-perl based ripper/encoder/normalize gui"
HOMEPAGE="http://gnormalize.sourceforge.net/"
SRC_URI="mirror://sourceforge/${PN}/${P}.tar.gz"
LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"

IUSE="aac cddb flac musepack oggvorbis"
DEPEND=" >=dev-perl/gtk2-perl-1.040
	media-sound/normalize
	media-sound/cdparanoia
	media-sound/lame	
	dev-perl/MP3-Info
	media-sound/cdcd
	aac? ( media-libs/faac
		media-libs/faad2 )
	musepack? ( media-sound/musepack-tools )
	flac? ( >=media-libs/flac-1.1.1 )
	oggvorbis? ( media-sound/vorbis-tools )
	cddb? ( dev-perl/CDDB_get )"
	
src_install() {
	dobin gnormalize
	doicon icons/gnormalize*.png
	dodoc README
	insinto /usr/share/${PN}
	doins -r animations
}

# Copyright 1999-2006 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

DESCRIPTION="Gtk2-Perl front-end to various audio utilities"
HOMEPAGE="http://gnormalize.sourceforge.net/"
SRC_URI="mirror://sourceforge/${PN}/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="aac cddb flac mp3 musepack normalize vorbis"

RDEPEND="dev-perl/gtk2-perl
	aac? ( media-libs/faac
		media-libs/faad2 )
	cddb? ( dev-perl/CDDB_get
		media-sound/cdcd
		|| ( media-sound/cdparanoia
			virtual/cdrtools ) )
	flac? ( media-libs/flac
		!vorbis? ( media-sound/flac123 ) )
	mp3? ( media-sound/lame
		dev-perl/MP3-Info
		|| ( media-sound/madplay
			media-sound/mpg321
			media-sound/mpg123 ) )
	musepack? ( media-sound/musepack-tools )
	normalize? ( media-sound/normalize )
	vorbis? ( media-sound/vorbis-tools )"

src_unpack() {
	unpack ${A}
	cd "${S}"
	unpack ./${PN}.1.bz2
}

src_install() {
	dobin ${PN} || die "dobin failed"

	insinto /usr/share/${PN}
	doins -r animations || die "doins failed"

	doicon icons/${PN}.png
	make_desktop_entry ${PN}

	doman ${PN}.1
	dodoc README
}

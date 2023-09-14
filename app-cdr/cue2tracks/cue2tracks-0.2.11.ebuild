# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

DESCRIPTION="Bash script for split audio CD image files with cue sheet to tracks and write tags."
HOMEPAGE="http://cyberdungeon.org.ru/~killy/projects/${PN}/"
SRC_URI="http://cyberdungeon.org.ru/~killy/files/projects/${PN}/${P}.tar.bz2"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="x86 amd64"
IUSE="flake mac tta shorten wavpack mp3 m4a vorbis"

DEPEND=""

RDEPEND="
	>=media-sound/shntool-3.0.0
	app-shells/bash
	media-libs/flac
	app-cdr/cuetools
	flake? ( media-sound/flake )
	mac? ( media-sound/mac )
	tta? ( media-sound/ttaenc )
	shorten? ( media-sound/shorten )
	wavpack? ( media-sound/wavpack media-sound/apetag )
	mp3? ( media-sound/lame media-sound/id3v2 )
	vorbis? ( media-sound/vorbis-tools )
	m4a? ( media-video/mpeg4ip media-libs/faac media-libs/faad2 )
	"

src_install() {
	dobin "${PN}" || die
	dodoc AUTHORS INSTALL ChangeLog README TODO
}

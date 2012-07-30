# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="2"

DESCRIPTION="a realtime monophonic (with chords) MIDI keyboard to Lilypond converter"
HOMEPAGE="http://www.volny.cz/smilauer/rumor/"
SRC_URI="http://www.volny.cz/smilauer/rumor/src/${P}.tar.bz2"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86"
IUSE="alsa guile"

DEPEND="alsa? ( media-libs/alsa-lib )
	guile? ( dev-scheme/guile )"
RDEPEND="${DEPEND}"

src_install() {
	emake DESTDIR="${D}" install || die "install failed"
}

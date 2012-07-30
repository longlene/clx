# Copyright 1999-2006 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

DESCRIPTION="A simple command line JACK capture client that records
what is coming out your speakers."

HOMEPAGE="http://www.notam02.no/arkiv/src/"
SRC_URI="http://www.notam02.no/arkiv/src/${P}.tar.gz"
# No license in source, but README states the program is based on 
# code from an example that comes with jack, which is GPL-2.
LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86"
IUSE=""
DEPEND="media-sound/jack-audio-connection-kit
	media-libs/libsndfile
	media-sound/meterbridge"
RDEPEND="${DEPEND}"

src_compile() {
	emake || die "emake failed"
}

src_install() {
	dobin jack_capture
	dodoc README
}

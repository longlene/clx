# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

MY_P="SIDPlayer-${PV}"

DESCRIPTION="Sidplayer is a replayer program for C64 music"
HOMEPAGE="http://sidplayer.cebix.net/"
SRC_URI="http://sidplayer.cebix.net/downloads/${MY_P}.tar.gz"

LICENSE="GPL"
SLOT="0"
KEYWORDS="x86 amd64" 
IUSE="sdl"

DEPEND=">=media-libs/libsdl-1.2.10
	media-libs/sdl-sound"

RDEPEND="${DEPEND}"

S="${WORKDIR}/${MY_P}"

src_compile() {
	econf || die "econf failed"
	emake || die "emake failed"
}

src_install() {
	emake DESTDIR="${D}" install || die "emake install failed"
}

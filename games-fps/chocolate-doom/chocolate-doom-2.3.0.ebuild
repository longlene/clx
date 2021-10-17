# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit autotools eutils vcs-snapshot

DESCRIPTION="Doom port designed to act identically to the original game"
HOMEPAGE="http://www.chocolate-doom.org/"
SRC_URI="https://github.com/chocolate-doom/chocolate-doom/archive/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="server"

DEPEND=">=media-libs/libsdl-1.1.3
	media-libs/sdl-mixer
	media-libs/sdl-net"

src_prepare() {
	eapply_user
	eautoreconf
}

src_configure() {
	econf \
		--disable-sdltest \
		--disable-dependency-tracking
}

#src_install() {
#	dobin src/chocolate src/chocolate-setup
#	if use server ; then
#		dosbin src/chocolate-server
#	fi
#
#	newicon data/doom.png "${PN}.png"
#	make_desktop_entry "${PN}" "Chocolate Doom"
#	newicon data/setup.png chocolate-setup.png
#	make_desktop_entry chocolate-setup "Chocolate Doom Setup" chocolate-setup
#
#	doman man/*.{5,6}
#	dodoc README.md HACKING.md
#}

pkg_postinst() {
	echo
	elog "To play the original Doom levels, place doom.wad and/or doom2.wad"
	elog "into "${GAMES_DATADIR}"/doom-data, then run: ${PN}"
	elog
	elog "To configure game options run:  chocolate-setup"
	echo
}

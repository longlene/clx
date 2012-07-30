# Copyright 1999-2005 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

# inherit games
# eh dunno if this is necessary

DESCRIPTION="if2a is a free software client for F2A/F2A Ultra GBA development cartridges. With it you can read/write ROMS onto a Gameboy Advance flash cartridge, thus allowing you to run your own programs."
HOMEPAGE="http://if2a.free.fr/index.html"
SRC_URI="http://if2a.free.fr/downloads/if2a/if2a-0.94.4.tar.bz2"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86"
IUSE=""

DEPEND="dev-libs/libusb"
RDEPEND="dev-libs/libusb"

src_compile() {
# doesn't support parallel compile
	emake -j1 || die "emake failed"
}

src_install() {
	exeinto /usr/bin
	doexe if2a
}


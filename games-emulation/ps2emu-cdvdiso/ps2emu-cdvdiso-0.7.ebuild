# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit games

PCSX2="pcsx2-0.9.4"

DESCRIPTION="PS2Emu ISO CDVD plugin"
HOMEPAGE="http://www.pcsx2.net/"
SRC_URI="mirror://sourceforge/pcsx2/${PCSX2}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="app-arch/bzip2
	sys-libs/zlib
	>=x11-libs/gtk+-2"
RDEPEND="${DEPEND}"

S="${WORKDIR}/${PCSX2}/plugins/cdvd/CDVDiso/src/Linux"

src_unpack() {
	unpack ${A}
	cd "${S}"
	
	sed -i \
		-e '/^CC =/d' \
		-e '/\bstrip\b/d' \
		-e 's/-g\b//g' \
		-e 's/CFLAGS =/CFLAGS +=/' \
		Makefile || die
}

src_install() {
	exeinto "`games_get_libdir`/ps2emu/plugins"
	newexe libCDVDiso.so libCDVDiso.so.${PV} || die
	exeinto "`games_get_libdir`/ps2emu/plugins/cfg"
	doexe cfgCDVDiso || die
	dodoc ../../ReadMe.txt || die
	prepgamesdirs
}

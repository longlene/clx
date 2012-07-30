# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

ESVN_REPO_URI="https://pcsx2.svn.sourceforge.net/svnroot/pcsx2/plugins/spu2/SPU2null"
inherit eutils games subversion

DESCRIPTION="PS2Emu null sound plugin"
HOMEPAGE="http://www.pcsx2.net/"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS=""
IUSE="doc"

DEPEND=">=x11-libs/gtk+-2"
RDEPEND="${DEPEND}"

S="${WORKDIR}/${PCSX2}/SPU2null"

src_unpack() {
	subversion_src_unpack
	S="${S}/Src"
	cd "${S}"
	
	sed -i \
		-e '/^CC =/d' \
		-e '/\bstrip\b/d' \
		-e 's/-O[0-9]\b//g' \
		-e 's/-fomit-frame-pointer\b//g' \
		Makefile || die
}

src_install() {
	exeinto "$(games_get_libdir)/ps2emu/plugins"
	doexe libSPU2null.so || die
	use doc && dodoc ../ReadMe.txt Changelog.txt || die
	prepgamesdirs
}

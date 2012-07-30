# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

ESVN_REPO_URI="https://pcsx2.svn.sourceforge.net/svnroot/pcsx2/plugins/spu2/PeopsSPU2"
inherit eutils games subversion

DESCRIPTION="P.E.Op.S PS2Emu sound plugin"
HOMEPAGE="http://www.pcsx2.net/"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS=""
IUSE="alsa oss"

DEPEND="alsa? ( media-libs/alsa-lib )"
RDEPEND="${DEPEND}"

S="${WORKDIR}/PeopsSPU2"

pkg_setup() {
	if ! use oss && ! use alsa; then
		die "Either the alsa or oss USE flag must be enabled!"
	fi
}

src_unpack() {
	subversion_src_unpack
	cd "${S}"

	sed -i \
		-e '/^CC =/d' \
		-e '/\bstrip\b/d' \
		-e 's/-O[0-9]\b//g' \
		-e 's/-fomit-frame-pointer\b//g' \
		-e 's/-ffast-math\b//g' \
		-e 's/CCFLAGS3 =/CCFLAGS3 = $(CFLAGS)/' \
		Makefile || die
}

src_compile() {
	if use oss; then
		sed -i 's/USEALSA = .*$/USEALSA = FALSE/' Makefile
		emake || die
	fi

	if use alsa; then
		sed -i 's/USEALSA = .*$/USEALSA = TRUE/' Makefile
		emake || die
	fi
}

src_install() {
	exeinto "$(games_get_libdir)/ps2emu/plugins"

	if use oss; then
		doexe libspu2PeopsOSS.so.* || die
	fi
	
	if use alsa; then
		doexe libspu2PeopsALSA.so.*|| die
	fi
	
	prepgamesdirs
}

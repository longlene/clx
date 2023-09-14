# Copyright 1999-2006 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

inherit versionator games

MY_PV=$(delete_all_version_separators)

DESCRIPTION="Atari 2600 emulator"
HOMEPAGE="http://www.whimsey.com/z26/"
SRC_URI="http://www.whimsey.com/${PN}/${PN}v${MY_PV}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86"
IUSE=""

RDEPEND=">=media-libs/libsdl-1.2.3"
DEPEND="${RDEPEND}
	dev-lang/perl
	>=dev-lang/nasm-0.98.33"

S=${WORKDIR}/${PN}

src_unpack() {
	unpack ${A}

	mv "$(find . -maxdepth 1 -name "${PN}*" -type d)" ${PN}
}

src_compile() {
	emake -j1 linux || die "emake linux failed"
}

src_install() {
	make \
		INSTALL_BINDIR="${D}/${GAMES_BINDIR}" \
		INSTALL_MANDIR="${D}/usr/share/man/man1" \
		install || die "make install failed"

	doicon z26_icon.png
	dodoc README.TXT

	prepgamesdirs
}

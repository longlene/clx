# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header$

EAPI=1

inherit games

DESCRIPTION="Text-based pacman clone with many variants, sizes and other features"
HOMEPAGE="http://myman.sourceforge.net/"
SRC_URI="mirror://sourceforge/${PN}/${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE="+iconv libcaca +ncurses slang +unicode"
## pdcurses not in portage so do not use them

RDEPEND="ncurses? ( sys-libs/ncurses )
	slang? ( sys-libs/slang )
	iconv? ( virtual/libiconv )
	libcaca? ( media-libs/libcaca )
	"
DEPEND="${RDEPEND}"

src_compile() {
	local MYOPTS
	if use unicode; then
		use slang && MYOPTS="--with-slang-utf8"
		use ncurses && MYOPTS="${MYOPTS} --with-ncursesw"
	else
		use slang && MYOPTS="--with-slang"
		use ncurses && MYOPTS="${MYOPTS} --with-ncurses"
	fi
	if ! use slang && ! use ncurses; then
		MYOPTS="${MYOPTS} --with-raw"
	fi
	egamesconf \
		--docdir=${GAMES_DATADIR_BASE}/doc/ \
		$MYOPTS \
		$(use_with iconv) \
		$(use_with libcaca) \
		--without-xcurses \
		|| die "Configure failed!"

	emake || die "Make failed!"
}

src_install() {
	emake DESTDIR="${D}" install || die "Install failed"
	prepgamesdirs
}

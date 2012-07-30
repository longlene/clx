# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="2"

inherit cmake-utils games

DESCRIPTION="Enhanced OpenGL port of the official DOOM source code that also supports Heretic, Hexen, and Strife"
HOMEPAGE="http://grafzahl.drdteam.org/"
SRC_URI="http://omploader.org/vNGsxMg/gzdoom-1.4.8.tar.bz2"

# It's not yet clear against which licenses ZDoom source code is released :(
LICENSE="|| ( DOOMLIC BUILDLIC )"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="asm doc gtk"

DEPEND="media-libs/libsdl
	asm? ( || ( dev-lang/nasm dev-lang/yasm ) )
	gtk? ( x11-libs/gtk+:2 )
	media-libs/fmod:1
	media-libs/flac
	media-libs/jpeg"

src_compile() {
	cmake-utils_src_compile
}

src_prepare() {
	# Use default game data path"
	sed -i \
		-e "s:/usr/local/share/:${GAMES_DATADIR}/doom-data/:" \
		src/sdl/i_system.h || die "sed i_system.h failed"
}

src_configure() {
	local mycmakeargs=(
		$(cmake-utils_use_no asm ASM)
		$(cmake-utils_use_no gtk GTK)
	)

	cmake-utils_src_configure
}

src_install() {
	if use doc; then
		dodoc docs/*.txt || die "dodoc failed"
		dohtml docs/console*.{css,html} || die "dohtml failed"
	fi

	cd "${CMAKE_BUILD_DIR}" || die
	dogamesbin ${PN} || die "dogamesbin failed"

	insinto "${GAMES_DATADIR}/doom-data"
	doins ${PN}.pk3 || die "doins failed"

	prepgamesdirs
}

pkg_postinst() {
	games_pkg_postinst

	elog
	elog "Copy or link wad files into ${GAMES_DATADIR}/doom-data/"
	elog "(the files must be readable by the 'games' group)."
	elog
	elog "To play, simply run:"
	elog
	elog "   gzdoom"
	if use doc; then
		elog
		elog "See /usr/share/doc/${P}/zdoom.txt.bz2 for more info"
	fi
	elog
}

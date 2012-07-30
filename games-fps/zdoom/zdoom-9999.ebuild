# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit cmake-utils eutils toolchain-funcs subversion games

DESCRIPTION="Enhanced port of the official DOOM source code,that also support Heretic,Hexen and Strife"
HOMEPAGE="http://www.zdoom.org"
ESVN_REPO_URI="http://mancubus.net/svn/hosted/zdoom/zdoom/trunk/"

# It's not yet clear against which licenses ZDoom source code is released :(
LICENSE="|| ( DOOMLIC BUILDLIC )"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="asm debug gtk"

DEPEND=">=media-libs/libsdl-1.2.8-r1
	asm? ( || ( >=dev-lang/nasm-0.98.39-r3 >=dev-lang/yasm-0.7.1 ) )
	gtk? ( >=x11-libs/gtk+-2.0 )
	>=media-libs/fmod-4.14
	>=media-libs/flac-1.1.2-r7
	media-libs/jpeg"


pkg_setup() {
	games_pkg_setup
}

src_unpack() {
	subversion_src_unpack || die "svn_unpack failed"

	cd "${S}"

	# Use default game data path
	sed -i \
			-e "s:/usr/local/share/:/usr/share/games/doom-data/:" \
			src/sdl/i_system.h \
			|| die "sed i_system.h failed"
}

src_compile() {
	local \
		with_asm="-DNO_ASM=yes" \
		with_gtk="-DNO_GTK=yes"

	use asm && with_asm="-DNO_ASM=no"
	use gtk && with_gtk="-DNO_GTK=no"

	mycmakeargs="${mycmakeargs}
					${with_asm}
					${with_gtk}
					-DNO_STRIP=yes"

	cmake-utils_src_configurein

	cmake-utils_src_make
}

src_install() {
	dogamesbin "src/${PN}" || die "dogamesbin failed"

	insinto "${GAMES_DATADIR}/doom-data"
	doins "${PN}.pk3" || die "doins failed"

	dodoc docs/{commands,history,rh-log,zdoom}.txt
	dohtml docs/console*.{css,html}

	prepgamesdirs
}

pkg_postinst() {
	games_pkg_postinst

	echo
	elog "Copy or link wad files into ${GAMES_DATADIR}/doom-data/"
	elog "(the files must be readable by the 'games' group)."
	elog
	elog "To play, simply run:"
	elog
	elog "   zdoom"
	elog
	elog "See /usr/share/doc/${P}/zdoom.txt.gz for more info"
	echo
}

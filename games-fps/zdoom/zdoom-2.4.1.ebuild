# Copyright 1999-2006 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit eutils toolchain-funcs games

DESCRIPTION="Enhanced port of the official DOOM source code,that also support Heretic,Hexen and Strife"
HOMEPAGE="http://www.zdoom.org"
#SRC_URI="mirror://sourceforge/${PN}/${P}.tar.bz2"
SRC_URI="http://zdoom.org/files/zdoom/2.4/zdoom-${PV}-src.7z"

# It's not yet clear against which licenses ZDoom source code is released :(
LICENSE="|| ( doomsource buildlic ravenlic zdoom )"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE="debug"

DEPEND=">=media-libs/libsdl-1.2.8-r1
	>=dev-lang/nasm-0.98.39-r3
	>=media-libs/fmod-4.26
	>=media-libs/flac-1.1.2-r3
	media-libs/jpeg"


pkg_setup() {
	games_pkg_setup
}

src_unpack() {
	unpack ${A} || die "unpack failed"

	# Use default game data path
	sed -i \
			-e "s:/usr/local/share/:/usr/share/games/doom-data/:" \
			src/sdl/i_system.h \
			|| die "sed i_system.h failed"

	local sdlcflags sdlldflags
	sdlcflags=`sdl-config --cflags`
	sdlldflags=`sdl-config --libs`

	# extract FMOD version
	FV=`equery list "media-libs/fmod" | grep fmod`
	if "$?" == 1; then
	  die "could not determine fmod version or not installed."
	fi
	FV=`echo "$FV" | sed 's/.*\([0-9]\+\)\.\([0-9]\+\)\.\([0-9]\+\).*/\1\2\3/g'`

	ln -s /opt/fmodex "fmodapi${FV}linux" || die
}

src_compile() {

	local opts
	
	use debug && opts="DEBUG=1"

#	make clean || die "make clean failed"

	CC="$(tc-getCC)" \
	CXX="$(tc-getCXX)" \
	CFLAGS="${CFLAGS}" \
	CXXFLAGS="${CXXFLAGS}" \
	LDFLAGS="${LDFLAGS}" \
	cmake ${opts} CMakeLists.txt \
	|| die "cmake failed"

	make || die "make failed"
}

src_install() {
	local myexe

	if use debug; then
		myexe="${PN}d"
		newgamesbin ${myexe} ${PN} || die "newgamesbin failed"
	else
	    echo ${PN}
		dogamesbin ${PN} || die "dogamesbin failed"
	fi

	insinto "${GAMES_DATADIR}/doom-data"

	doins ${WORKDIR}/${PN}.pk3 || die "doins failed"

	dodoc ${WORKDIR}/docs/{commands,history,zdoom}.txt || die "docs failed"

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

# Copyright 1999-2007 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/games-fps/ezquake-bin/ezquake-bin-1.8.0.ebuild,v 1.5 2007/03/12 14:38:40 genone Exp $

inherit games versionator

MY_PV=$(get_version_component_range 1-2)
DESCRIPTION="Quake 2 engine focused on single player and 64bits."
HOMEPAGE="http://www.yamagi.org/quake2/"
SRC_URI="http://aur.archlinux.org/packages/yamagi-quake2/yamagi-quake2.tar.gz"
SRC_URI="http://deponie.yamagi.org/quake2/quake2-$MY_PV.tar.bz2"
LICENSE="GPL"
SLOT="0"
KEYWORDS="amd64 x86"
DEPENDS="libjpeg sdl libxxf86vm libxxf86dga"
RESTRICT=""
IUSE="cdripper starter-script"

S=${WORKDIR}/quake2-${MY_PV}

src_unpack() {
	unpack ${A}
}

src_compile() {
	make
}

src_install() {
	mkdir "$S/bins/"

	if use cdripper-script ; then
		mv "$S/tools/cdripper.sh" "$S/bins/yamagi-cdripper" || die "move ripper script failed"
	fi

	if use dedicated ; then
		mv "$S/release/q2ded" "$S/bins/" || die "move q2ded failed"
	fi

	mv "$S/release/quake2" "$S/bins/yamagi-q2" || die "move yamagi-o failes"
	if use starter-script ; then
		mv "$S/tools/quake2-start.sh" "$S/bins/yamagi" || die "move starter script failed"
		sed -i 's/# \.\/quake2 $\*/\/usr\/games\/bin\/yamagi-q2 \+set basedir ~\/\.quake2 $\*/g' "$S/bins/yamagi"		
	else
		echo '/usr/games/bin/yamagi-q2 +set basedir ~/.quake2 $*' > "$S/bins/yamagi"
	fi

	mv 

	dogamesbin $S/bins/* || die "dobins failed"
	newicon "$S/icon/Quake2.png" "yamagi.png" || die "icon failed"

	insinto ${GAMES_DATADIR}/quake2
	doins "$S/release/ref_gl.so" || die "doins ref_gl.so failed"
	insinto ${GAMES_DATADIR}/quake2/baseq2
	doins "$S/release/baseq2/game.so" || die "baseq2 game.so doins failed"
	insinto ${GAMES_DATADIR}/quake2/ctf
	doins "$S/release/ctf/game.so" || die "ctf games.so doins failed"

	prepgamesdirs
}

pkg_postinst() {
	games_pkg_postinst

	/usr/share/games/quake2/

}


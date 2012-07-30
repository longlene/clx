# Copyright 1999-2007 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/games-fps/ezquake-bin/ezquake-bin-1.8.0.ebuild,v 1.5 2007/03/12 14:38:40 genone Exp $

inherit games versionator

MY_PV=$(get_version_component_range 1-2)
DESCRIPTION="R1Q2 is an enhanced client/server for Quake II. focused on providing stability, security and speed whilst remaining 
fully compatible with existing mods and other clients."
HOMEPAGE="http://www.r1ch.net/stuff/r1q2/"
SRC_URI="http://www.r1ch.net/stuff/r1q2/src/r1q2-b${MY_PV}-src.zip"
LICENSE="GPL"
SLOT="0"
KEYWORDS="amd64 x86"
#DEPENDS="libjpeg sdl libxxf86vm libxxf86dga"
RESTRICT=""
IUSE="dedicated"

S=${WORKDIR}

src_unpack() {
	unpack ${A}
}

src_compile() {
	# fix some source problems
	sed -i 's/\(qglDeleteTextures[ ]*(.*,\)/\1 (GLuint \*)/g' $WORKDIR/ref_gl/gl_image.c || die "sed 1 failed"
	sed -i 's/jpeg_mem_src/r1q2_jpeg_mem_src/g' $WORKDIR/ref_gl/gl_image.c || die "sed 2 failed"
	# not needed since the inclusion of the previous sed command: sed -i
	# "s/'\([a-zA-Z0-9\\][a-zA-Z0-9\\][a-zA-Z0-9\\]*\)'/\"\1\"/g" $WORKDIR/ref_gl/gl_image.c || die "sed 3 failed"
	cd $S/binaries/client && make || die "make client failed"
	cd $S/binaries/ref_gl && make || die "make ref_gl failed"
	cd $S/binaries/game && make || die "make game failed"
	if dedicated ; then
		cd $S/binaries/r1q2ded && make || die "make r1q2ded failed"
	fi
}

src_install() {
	mv "$S/binaries/client/quake2" "$S/binaries/client/r1q2" || die "move quake2 failed"
	dogamesbin $S/binaries/client/r1q2 || die "r1q2 failed"
	if use dedicated ; then
		dogamesbin $S/binaries/r1q2ded/r1q2ded || die "r1q2ded failed"
	fi

	insinto ${GAMES_DATADIR}/quake2
	doins "$S/binaries/game/gamei386.so" || die "gamei386.so failes"
	doins "$S/binaries/ref_gl/ref_gl.so" || die "ref_gl.so failed"

	prepgamesdirs
}

pkg_postinst() {
	games_pkg_postinst
	echo
	einfo "NOTE: you must use GCC 2.7.2 to maintain compatibility with old mods."
}


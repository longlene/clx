# Copyright 1999-2007 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

MOD_DESC="Quake 1 conversion map for Doom 3"
MOD_NAME="Shambler's Castle"
MOD_DIR="shamblerscastle"
MOD_MAP="castle"

inherit games games-mods

HOMEPAGE="http://www.monster-clip.com/maps/castle/castle.htm"
SRC_URI="http://www.quaddicted.com/stuff/hosted/quakemod.zip
	http://www.monster-clip.com/maps/castle/quakemod.zip
	http://www.doomwadstation.com/doom3tc/quakemod/quakemod.zip"

LICENSE="as-is"

KEYWORDS="-* amd64 x86"

RDEPEND="${CATEGORY}/${GAME}"

src_unpack() {
	games-mods_src_unpack

	rm *.{bat,tga}

	# Using a less generic directory name
	mv quake "${MOD_DIR}" || die
}

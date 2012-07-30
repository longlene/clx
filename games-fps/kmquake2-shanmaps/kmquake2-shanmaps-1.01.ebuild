# Copyright 1999-2007 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit eutils games

ENGINE_EXE="kmquake2"
ENGINE_NAME="KM Quake 2"
M="http://www.markshan.com/thesinraven"

DESCRIPTION="High-quality Quake 2 map packs for use with kmquake2"
HOMEPAGE="http://www.markshan.com/thesinraven/"
SRC_URI="http://www.markshan.com/maps/paximperia.zip
	http://www.markshan.com/engine/pax_101_patch.zip
	${M}/maps/the_sin_net_multiplayer_map_pack.tar.gz
	${M}/mods/1492.tar.gz
	${M}/mods/forever.tar.gz
	${M}/mods/genome.tar.gz
	${M}/mods/gladiator.tar.gz
	${M}/mods/lamber.tar.gz
	${M}/mods/return.tar.gz
	${M}/mods/xxx.tar.gz"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~x86"
IUSE=""

# Requires the pak files from the Quake 2 CD.
# Uses some kmq2gamei386.so files from kmquake2-mods.
RDEPEND="games-fps/quake2-data
	games-fps/kmquake2-mods"
DEPEND="app-arch/unzip"

S=${WORKDIR}
dir=${GAMES_DATADIR}/quake2

src_unpack() {
	unpack ${A}

	mkdir pax || die
	# default.cfg is needed for Pax to go into the first map on a new game
	mv *.cfg pax*.pak readme.html levelshots sound pax || die

	# The .so files are for an old Quake 2 engine
	find . -name '*.so' -exec rm {} \;
	rm *.{bat,dll}
}

src_install() {
	local icon=${ENGINE_EXE}.png
	local libdir=$(games_get_libdir)/kmquake2

	insinto "${dir}"
	doins -r * || die "doins -r failed"

	rm "${D}/${dir}"/*.txt
	dodoc *.txt

	# These map packs use code from the official expansion pack mods
	local game
	for game in 1492 return xxx ; do
		dodir "${libdir}/${game}"
		dosym "${libdir}"/rogue_xatrix/kmq2gamei386.so "${libdir}/${game}"
	done

	# Pax Imperia doesn't need a map specified on the command-line
	games_make_wrapper ${ENGINE_EXE}-pax "${ENGINE_EXE} +set game pax"
	make_desktop_entry ${ENGINE_EXE}-pax "${ENGINE_NAME} - Pax Imperia" "${icon}"

	for game in 1492 forever genome gladiator lamber xxx ; do
		games_make_wrapper "${ENGINE_EXE}-${game}" "${ENGINE_EXE} +set game ${game} +map ${game}"
	done
	games_make_wrapper ${ENGINE_EXE}-return "${ENGINE_EXE} +set game return +map genome"

	prepgamesdirs
}

pkg_postinst() {
	games_pkg_postinst

	elog "These Quake 2 map packs work with the kmquake2 engine."
	elog "Some of the maps will also work with other Quake 2 engines."
	elog
	elog "To change the skill level to easy for map packs that start immediately,"
	elog "use e.g.:  kmquake2 +set game 1492 +set skill 0 +map 1492"
	echo
}

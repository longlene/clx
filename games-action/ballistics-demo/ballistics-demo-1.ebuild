# Copyright 1999-2007 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit eutils games

DESCRIPTION="Super-fast 3D racing on hover bikes"
HOMEPAGE="http://www.linuxgamepublishing.com/info.php?id=ballistics"
# Patches: http://updatefiles.linuxgamepublishing.com/ballistics-demo/
# Unversioned filename, grrr (is pre-patched).
SRC_URI="http://demofiles.linuxgamepublishing.com/ballistics/${PN}.run"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""
RESTRICT="mirror strip"

# Not bothering with "dynamic" USE flag.
# Uses OSS for audio.
# dynamic? ( dev-games/libgrapple )
RDEPEND="
	x86? (
		media-libs/libsdl
		x11-libs/gtk+
		x11-libs/libX11
		x11-libs/libXau
		x11-libs/libXdmcp
		x11-libs/libXext
		x11-libs/libXi )
	amd64? (
		app-emulation/emul-linux-x86-gtklibs
		app-emulation/emul-linux-x86-sdl )"

S=${WORKDIR}

src_unpack() {
	unpack_makeself ${PN}.run
	unpack ./data/data.tar.gz

	rm -rf data lgp_* setup*

	mv bin "${T}" || die "mv"
}

src_install() {
	local dir=${GAMES_PREFIX_OPT}/${PN}

	exeinto "${dir}"
	doexe "${T}"/bin/Linux/x86/* || die "doexe"

	insinto "${dir}"
	doins -r * || die "doins -r"

	games_make_wrapper ${PN}-config ./ballistics_demo-config "${dir}" "${dir}"
	games_make_wrapper ${PN} ./ballistics_demo "${dir}" "${dir}"
	newicon icon.xpm ${PN}.xpm || die "newicon"
	make_desktop_entry ${PN} "Ballistics (Demo)" ${PN}.xpm

	prepgamesdirs
}

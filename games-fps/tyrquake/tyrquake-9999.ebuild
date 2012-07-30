# Copyright 1999-2007 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit eutils git games

DESCRIPTION="Conservative Quake 1 engine"
HOMEPAGE="http://disenchant.net/engine.html"
SRC_URI=""

EGIT_REPO_URI="git://disenchant.net/${PN}"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86"
IUSE="cdinstall debug dedicated opengl X"

S=${WORKDIR}/engine
dir=${GAMES_DATADIR}/quake1

# These dependencies have not been checked
COMMON="media-libs/alsa-lib
	media-libs/jpeg
	media-libs/libogg
	media-libs/libpng
	media-libs/libvorbis
	net-libs/gnutls
	virtual/opengl
	media-libs/libsdl
	x11-libs/libX11
	x11-libs/libXext
	x11-libs/libXxf86vm"
RDEPEND="${COMMON}
	cdinstall? ( games-fps/quake1-data )"
DEPEND="${COMMON}
	dev-util/pkgconfig
	x11-proto/xextproto
	x11-proto/xf86dgaproto
	x11-proto/xf86vidmodeproto
	x11-proto/xproto"

src_unpack() {
	#unpack ${A}
	git_src_unpack
	cd "${S}"

}

src_compile() {
	yesno() { useq $1 && echo Y || echo N ; }

	local apps
	use dedicated && apps="${apps} tyr-qwsv"
	use X && apps="${apps} tyr-quake tyr-qwcl"
	if use opengl || [[ -z "${apps}" ]] ; then
		apps="${apps} tyr-glquake tyr-glqwcl"
	fi

	emake prepare || die "emake prepare failed"

	emake \
		USE_X86_ASM=$(yesno x86) \
		DEBUG=$(yesno debug) \
		QBASEDIR="${dir}" \
		STRIP=echo \
		${apps} \
		|| die "emake ${apps} failed"
}

src_install() {
	dogamesbin tyr-* || die "dogamesbin failed"

	dodoc readme.txt

	prepgamesdirs
}

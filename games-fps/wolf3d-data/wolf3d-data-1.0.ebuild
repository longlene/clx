# Copyright 1999-2006 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

inherit eutils games

DESCRIPTION="Wolfenstein 3D data files."
HOMEPAGE="http://www.idsoftware.com/"
SRC_URI=""

LICENSE=""
SLOT="0"
KEYWORDS="amd64 x86"
IUSE=""

DEPEND=""
#needs a client to use tha data...
RDEPEND="games-fps/wolfgl"

S=${WORKDIR}/${PF}

pkg_setup() {
	export CDROM_NAME_SET=("Existing Install" "Wolfenstein 3D CD")
	cdrom_get_cds vswap.wl6:Install/data/WOLF3D

	if [[ ${CDROM_SET} -ne 0 &&  ${CDROM_SET} -ne 1 ]] ; then
		die "Error locating data files.";
	fi
}

src_unpack() {
	mkdir -p ${WORKDIR}/${PF}
	if [[ ${CDROM_SET} -eq 0 ]] ; then
		cp ${CDROM_ROOT}/audiohed.wl6 ${S}/audiohed.wl6 || die "Error copying audiohed.wl6.";
		cp ${CDROM_ROOT}/audiot.wl6 ${S}/audiot.wl6 || die "Error copying audiot.wl6.";
		cp ${CDROM_ROOT}/gamemaps.wl6 ${S}/gamemaps.wl6 || die "Error copying gamemaps.wl6.";
		cp ${CDROM_ROOT}/maphead.wl6 ${S}/maphead.wl6 || die "Error copying maphead.wl6.";
		cp ${CDROM_ROOT}/vgadict.wl6 ${S}/vgadict.wl6 || die "Error copying vgadict.wl6.";
		cp ${CDROM_ROOT}/vgagraph.wl6 ${S}/vgagraph.wl6 || die "Error copying vgagraph.wl6.";
		cp ${CDROM_ROOT}/vgahead.wl6 ${S}/vgahead.wl6 || die "Error copying vgahead.wl6.";
		cp ${CDROM_ROOT}/vswap.wl6 ${S}/vswap.wl6 || die "Error copying vswap.wl6.";
	else
		cp ${CDROM_ROOT}/Install/data/WOLF3D/AUDIOHED.WL6 ${S}/audiohed.wl6 || die "Error copying AUDIOHED.WL6.";
		cp ${CDROM_ROOT}/Install/data/WOLF3D/AUDIOT.WL6 ${S}/audiot.wl6 || die "Error copying AUDIOT.WL6.";
		cp ${CDROM_ROOT}/Install/data/WOLF3D/GAMEMAPS.WL6 ${S}/gamemaps.wl6 || die "Error copying GAMEMAPS.WL6.";
		cp ${CDROM_ROOT}/Install/data/WOLF3D/MAPHEAD.WL6 ${S}/maphead.wl6 || die "Error copying MAPHEAD.WL6.";
		cp ${CDROM_ROOT}/Install/data/WOLF3D/VGADICT.WL6 ${S}/vgadict.wl6 || die "Error copying VGADICT.WL6.";
		cp ${CDROM_ROOT}/Install/data/WOLF3D/VGAGRAPH.WL6 ${S}/vgagraph.wl6 || die "Error copying VGAGRAPH.WL6.";
		cp ${CDROM_ROOT}/Install/data/WOLF3D/VGAHEAD.WL6 ${S}/vgahead.wl6 || die "Error copying VGAHEAD.WL6.";
		cp ${CDROM_ROOT}/Install/data/WOLF3D/VSWAP.WL6 ${S}/vswap.wl6 || die "Error copying VSWAP.WL6.";
	fi
}

src_install() {
	dodir ${GAMES_DATADIR}/wolfgl
	dodir ${GAMES_DATADIR}/wolf3d

	insinto ${GAMES_DATADIR}/wolf3d

	doins ${S}/audiohed.wl6 || die "Error installing audiohed.wl6.";
	dosym ${GAMES_DATADIR}/wolf3d/audiohed.wl6 ${GAMES_DATADIR}/wolfgl/audiohed.wl6 || die "Error creating symlink of audiohed.wl6."

	doins ${S}/audiot.wl6 || die "Error installing audiot.wl6.";
	dosym ${GAMES_DATADIR}/wolf3d/audiot.wl6 ${GAMES_DATADIR}/wolfgl/audiot.wl6 || die "Error creating symlink of audiot.wl6."

	doins ${S}/gamemaps.wl6 || die "Error installing gamemaps.wl6.";
	dosym ${GAMES_DATADIR}/wolf3d/gamemaps.wl6 ${GAMES_DATADIR}/wolfgl/gamemaps.wl6 || die "Error creating symlink of gamemaps.wl6."

	doins ${S}/maphead.wl6 || die "Error installing maphead.wl6.";
	dosym ${GAMES_DATADIR}/wolf3d/maphead.wl6 ${GAMES_DATADIR}/wolfgl/maphead.wl6 || die "Error creating symlink of maphead.wl6."

	doins ${S}/vgadict.wl6 || die "Error installing vgadict.wl6.";
	dosym ${GAMES_DATADIR}/wolf3d/vgadict.wl6 ${GAMES_DATADIR}/wolfgl/vgadict.wl6 || die "Error creating symlink of vgadict.wl6."

	doins ${S}/vgagraph.wl6 || die "Error installing vgagraph.wl6.";
	dosym ${GAMES_DATADIR}/wolf3d/vgagraph.wl6 ${GAMES_DATADIR}/wolfgl/vgagraph.wl6 || die "Error creating symlink of vgagraph.wl6."

	doins ${S}/vgahead.wl6 || die "Error installing vgahead.wl6.";
	dosym ${GAMES_DATADIR}/wolf3d/vgahead.wl6 ${GAMES_DATADIR}/wolfgl/vgahead.wl6 || die "Error creating symlink of vgahead.wl6."

	doins ${S}/vswap.wl6 || die "Error installing vswap.wl6.";
	dosym ${GAMES_DATADIR}/wolf3d/vswap.wl6 ${GAMES_DATADIR}/wolfgl/vswap.wl6 || die "Error creating symlink of vswap.wl6."

	prepgamesdirs
}

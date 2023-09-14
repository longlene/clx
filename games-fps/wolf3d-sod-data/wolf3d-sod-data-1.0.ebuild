# Copyright 1999-2006 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

inherit games

DESCRIPTION="Wolfenstein 3D: Spear of Destiny data files."
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
	cdrom_get_cds vswap.sod:Install/data/WOLF3D

	if [[ ${CDROM_SET} -ne 0 &&  ${CDROM_SET} -ne 1 ]] ; then
		die "Error locating data files.";
	fi
}

src_unpack() {
	mkdir -p ${WORKDIR}/${PF}
	if [[ ${CDROM_SET} -eq 0 ]] ; then
		cp ${CDROM_ROOT}/audiohed.sod ${S}/audiohed.sod || die "Error copying audiohed.sod.";
		cp ${CDROM_ROOT}/audiot.sod ${S}/audiot.sod || die "Error copying audiot.sod.";
		cp ${CDROM_ROOT}/gamemaps.sd4 ${S}/gamemaps.sd4 || die "Error copying gamemaps.sd4.";
		cp ${CDROM_ROOT}/gamemaps.sd2 ${S}/gamemaps.sd2 || die "Error copying gamemaps.sd2.";
		cp ${CDROM_ROOT}/gamemaps.sd3 ${S}/gamemaps.sd3 || die "Error copying gamemaps.sd3.";
		cp ${CDROM_ROOT}/gamemaps.sod ${S}/gamemaps.sod || die "Error copying gamemaps.sod.";
		cp ${CDROM_ROOT}/maphead.sd1 ${S}/maphead.sd1 || die "Error copying maphead.sd1.";
		cp ${CDROM_ROOT}/maphead.sd2 ${S}/maphead.sd2 || die "Error copying maphead.sd2.";
		cp ${CDROM_ROOT}/maphead.sd3 ${S}/maphead.sd3 || die "Error copying maphead.sd3.";
		cp ${CDROM_ROOT}/maphead.sod ${S}/maphead.sod || die "Error copying maphead.sod.";
		cp ${CDROM_ROOT}/vgadict.sod ${S}/vgadict.sod || die "Error copying vgadict.sod.";
		cp ${CDROM_ROOT}/vgagraph.sod ${S}/vgagraph.sod || die "Error copying vgagraph.sod.";
		cp ${CDROM_ROOT}/vgahead.sod ${S}/vgahead.sod || die "Error copying vgahead.sod.";
		cp ${CDROM_ROOT}/vswap.sd4 ${S}/vswap.sd4 || die "Error copying vswap.sd4.";
		cp ${CDROM_ROOT}/vswap.sd2 ${S}/vswap.sd2 || die "Error copying vswap.sd2.";
		cp ${CDROM_ROOT}/vswap.sd3 ${S}/vswap.sd3 || die "Error copying vswap.sd3.";
		cp ${CDROM_ROOT}/vswap.sod ${S}/vswap.sod || die "Error copying vswap.sod.";
	else
		cp ${CDROM_ROOT}/Install/data/WOLF3D/AUDIOHED.sod ${S}/audiohed.sod || die "Error copying AUDIOHED.sod.";
		cp ${CDROM_ROOT}/Install/data/WOLF3D/AUDIOT.sod ${S}/audiot.sod || die "Error copying AUDIOT.sod.";
		cp ${CDROM_ROOT}/GAMEMAPS.SD4 ${S}/gamemaps.sd4 || die "Error copying GAMEMAPS.SD4.";
		cp ${CDROM_ROOT}/GAMEMAPS.SD2 ${S}/gamemaps.sd2 || die "Error copying GAMEMAPS.SD2.";
		cp ${CDROM_ROOT}/GAMEMAPS.SD3 ${S}/gamemaps.sd3 || die "Error copying GAMEMAPS.SD3.";
		cp ${CDROM_ROOT}/GAMEMAPS.SOD ${S}/gamemaps.sod || die "Error copying GAMEMAPS.SOD.";
		cp ${CDROM_ROOT}/MAPHEAD.SD1 ${S}/maphead.sd1 || die "Error copying MAPHEAD.SD1.";
		cp ${CDROM_ROOT}/MAPHEAD.SD2 ${S}/maphead.sd2 || die "Error copying MAPHEAD.SD2.";
		cp ${CDROM_ROOT}/MAPHEAD.SD3 ${S}/maphead.sd3 || die "Error copying MAPHEAD.SD3.";
		cp ${CDROM_ROOT}/MAPHEAD.SOD ${S}/maphead.sod || die "Error copying MAPHEAD.SOD.";
		cp ${CDROM_ROOT}/Install/data/WOLF3D/VGADICT.sod ${S}/vgadict.sod || die "Error copying VGADICT.sod.";
		cp ${CDROM_ROOT}/Install/data/WOLF3D/VGAGRAPH.sod ${S}/vgagraph.sod || die "Error copying VGAGRAPH.sod.";
		cp ${CDROM_ROOT}/Install/data/WOLF3D/VGAHEAD.sod ${S}/vgahead.sod || die "Error copying VGAHEAD.sod.";
		cp ${CDROM_ROOT}/VSWAP.SD4 ${S}/vswap.sd4 || die "Error copying VSWAP.SD4.";
		cp ${CDROM_ROOT}/VSWAP.SD2 ${S}/vswap.sd2 || die "Error copying VSWAP.SD2.";
		cp ${CDROM_ROOT}/VSWAP.SD3 ${S}/vswap.sd3 || die "Error copying VSWAP.SD3.";
		cp ${CDROM_ROOT}/VSWAP.SOD ${S}/vswap.sod || die "Error copying VSWAP.SOD.";
	fi
}

src_install() {
	dodir ${GAMES_DATADIR}/wolfgl
	dodir ${GAMES_DATADIR}/wolf3d

	insinto ${GAMES_DATADIR}/wolf3d

	doins ${S}/audiohed.sod || die "Error installing audiohed.sod.";
	dosym ${GAMES_DATADIR}/wolf3d/audiohed.sod ${GAMES_DATADIR}/wolfgl/audiohed.sod || die "Error creating symlink of audiohed.sod."

	doins ${S}/audiot.sod || die "Error installing audiot.sod.";
	dosym ${GAMES_DATADIR}/wolf3d/audiot.sod ${GAMES_DATADIR}/wolfgl/audiot.sod || die "Error creating symlink of audiot.sod."

	doins ${S}/gamemaps.sd4 || die "Error installing gamemaps..";
	dosym ${GAMES_DATADIR}/wolf3d/gamemaps.sd4 ${GAMES_DATADIR}/wolfgl/gamemaps.sd4 || die "Error creating symlink of gamemaps.sd4."

	doins ${S}/gamemaps.sd2 || die "Error installing gamemaps.sd2.";
	dosym ${GAMES_DATADIR}/wolf3d/gamemaps.sd2 ${GAMES_DATADIR}/wolfgl/gamemaps.sd2 || die "Error creating symlink of gamemaps.sd2."

	doins ${S}/gamemaps.sd3 || die "Error installing gamemaps.sd3.";
	dosym ${GAMES_DATADIR}/wolf3d/gamemaps.sd3 ${GAMES_DATADIR}/wolfgl/gamemaps.sd3 || die "Error creating symlink of gamemaps.sd3."

	doins ${S}/gamemaps.sod || die "Error installing gamemaps.sod.";
	dosym ${GAMES_DATADIR}/wolf3d/gamemaps.sod ${GAMES_DATADIR}/wolfgl/gamemaps.sod || die "Error creating symlink of gamemaps.sod."

	doins ${S}/maphead.sd1 || die "Error installing maphead.sd1";
	dosym ${GAMES_DATADIR}/wolf3d/maphead.sd1 ${GAMES_DATADIR}/wolfgl/maphead.sd1 || die "Error creating symlink of maphead.sd1."

	doins ${S}/maphead.sd2 || die "Error installing maphead.sd2";
	dosym ${GAMES_DATADIR}/wolf3d/maphead.sd2 ${GAMES_DATADIR}/wolfgl/maphead.sd2 || die "Error creating symlink of maphead.sd2."

	doins ${S}/maphead.sd3 || die "Error installing maphead.sd3";
	dosym ${GAMES_DATADIR}/wolf3d/maphead.sd3 ${GAMES_DATADIR}/wolfgl/maphead.sd3 || die "Error creating symlink of maphead.sd3."

	doins ${S}/maphead.sod || die "Error installing maphead.sod";
	dosym ${GAMES_DATADIR}/wolf3d/maphead.sod ${GAMES_DATADIR}/wolfgl/maphead.sod || die "Error creating symlink of maphead.sod."

	doins ${S}/vgadict.sod || die "Error installing vgadict.sod.";
	dosym ${GAMES_DATADIR}/wolf3d/vgadict.sod ${GAMES_DATADIR}/wolfgl/vgadict.sod || die "Error creating symlink of vgadict.sod."

	doins ${S}/vgagraph.sod || die "Error installing vgagraph.sod.";
	dosym ${GAMES_DATADIR}/wolf3d/vgagraph.sod ${GAMES_DATADIR}/wolfgl/vgagraph.sod || die "Error creating symlink of vgagraph.sod."

	doins ${S}/vgahead.sod || die "Error installing vgahead.sod.";
	dosym ${GAMES_DATADIR}/wolf3d/vgahead.sod ${GAMES_DATADIR}/wolfgl/vgahead.sod || die "Error creating symlink of vgahead.sod."

	doins ${S}/vswap.sd4 || die "Error installing vswap.sd4.";
	dosym ${GAMES_DATADIR}/wolf3d/vswap.sd4 ${GAMES_DATADIR}/wolfgl/vswap.sd4 || die "Error creating symlink of vswap.sd4."

	doins ${S}/vswap.sd2 || die "Error installing vswap.sd2.";
	dosym ${GAMES_DATADIR}/wolf3d/vswap.sd2 ${GAMES_DATADIR}/wolfgl/vswap.sd2 || die "Error creating symlink of vswap.sd2."

	doins ${S}/vswap.sd3 || die "Error installing vswap.sd3.";
	dosym ${GAMES_DATADIR}/wolf3d/vswap.sd3 ${GAMES_DATADIR}/wolfgl/vswap.sd3 || die "Error creating symlink of vswap.sd3."

	doins ${S}/vswap.sod || die "Error installing vswap.sod.";
	dosym ${GAMES_DATADIR}/wolf3d/vswap.sod ${GAMES_DATADIR}/wolfgl/vswap.sod || die "Error creating symlink of vswap.sod."

	prepgamesdirs
}

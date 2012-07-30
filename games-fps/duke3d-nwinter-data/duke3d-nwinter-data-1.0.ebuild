# Copyright 1999-2006 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

inherit eutils games

DESCRIPTION="Duke Nukem 3D: Nuclear Winter data files"
HOMEPAGE="http://www.3drealms.com/"
SRC_URI=""

LICENSE="DUKE3D"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE=""

DEPEND=""
RDEPEND=""

S=${WORKDIR}

pkg_setup() {
	export CDROM_NAME_SET=("Existing Install")
	cdrom_get_cds nwinter.grp

	if [[ ${CDROM_SET} -ne 0 ]] ; then
		die "Error locating data files.";
	fi
}

src_unpack() {
    echo ""
}

src_install() {
	local DATAROOT;

	case ${CDROM_SET} in
		0) DATAROOT="";;
	esac

	dodir ${GAMES_DATADIR}/duke3d

	insinto ${GAMES_DATADIR}/duke3d

	doins ${CDROM_ROOT}/$DATAROOT/nwinter.grp || die "Error installing nwinter.grp.";
	#? doins ${CDROM_ROOT}/$DATAROOT/duke.rts || die "Error installing duke.rts.";
	doins ${CDROM_ROOT}/$DATAROOT/nwinter.con || die "Error installing nwinter.con.";
	doins ${CDROM_ROOT}/$DATAROOT/nwdefs.con || die "Error installing nwdefs.con.";
	doins ${CDROM_ROOT}/$DATAROOT/nwactor.con || die "Error installing nwactor.con.";
	doins ${CDROM_ROOT}/$DATAROOT/nwsnow.con || die "Error installing nwsnow.con.";
	doins ${CDROM_ROOT}/$DATAROOT/_se.map || die "Error installing _se.map.";
	doins ${CDROM_ROOT}/$DATAROOT/_st.map || die "Error installing _st.map.";
	doins ${CDROM_ROOT}/$DATAROOT/_zoo.map || die "Error installing _zoo.map.";
	doins ${CDROM_ROOT}/$DATAROOT/demo3.dmo || die "Error installing demo3.dmo.";

	prepgamesdirs
}

pkg_postinst() {
        games_pkg_postinst

        elog "A client is needed to run the game, e.g. iculus's duke3d."
        elog "Run the game with: duke3d '/gnwinter.grp' '/xnwinter.con'"
        echo
}


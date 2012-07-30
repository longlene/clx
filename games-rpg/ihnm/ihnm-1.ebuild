# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit eutils games

DESCRIPTION="I Have No Mouth, and I Must Scream"
HOMEPAGE="http://harlanellison.com/herc.htm#ihnm"

LICENSE="freedist"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""
RESTRICT="strip"

RDEPEND=">=games-engines/scummvm-0.11.0"

S=${WORKDIR}
dir=${GAMES_DATADIR}/${PN}

src_install() {
	insinto "${dir}"

	cdrom_get_cds scream.res
	einfo "Copying files from CD..."
	doins ${CDROM_ROOT}/musicfm.res \
		${CDROM_ROOT}/musicgm.res \
		${CDROM_ROOT}/scream.res \
		${CDROM_ROOT}/patch.re_ \
		${CDROM_ROOT}/scripts.res \
		${CDROM_ROOT}/sfx.res \
		${CDROM_ROOT}/voicess.res \
		${CDROM_ROOT}/voices1.res \
		${CDROM_ROOT}/voices2.res \
		${CDROM_ROOT}/voices3.res \
		${CDROM_ROOT}/voices4.res \
		${CDROM_ROOT}/voices5.res \
		${CDROM_ROOT}/voices6.res || die "doins failed"

	games_make_wrapper ${PN} "scummvm -f -p \"${dir}\" ihnm"
	make_desktop_entry ${PN} "I Have No Mouth, and I Must Scream"

	prepgamesdirs
}

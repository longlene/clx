# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit games

DESCRIPTION="A 3D Fantasy MMORPG"
HOMEPAGE="http://planeshift.it"
SRC_URI="x86? ( http://www.psmirror.org/PlaneShift-v0.4.03-x86.bin )
	amd64? ( http://www.psmirror.org/PlaneShift-v0.4.03-x64.bin )"

LICENSE="GPL PlaneShift"
SLOT="0"
KEYWORDS="-* ~x86"
IUSE=""

src_unpack() {
	cp "${DISTDIR}/${A}" "${WORKDIR}"
	chmod +x "${WORKDIR}/${A}"
}

src_install() {
	"${WORKDIR}"/${A} \
		--mode unattended \
		--perms yes \
		--usergroup games \
		--prefix ${D}/${GAMES_PREFIX_OPT}

	rm "${D}/${GAMES_PREFIX_OPT}"/PlaneShift/psupdater
	rm "${D}/${GAMES_PREFIX_OPT}"/PlaneShift/psupdater.bin
	rm "${D}/${GAMES_PREFIX_OPT}"/PlaneShift/uninstall

	games_make_wrapper psclient "${GAMES_PREFIX_OPT}/PlaneShift/psclient"
	make_desktop_entry psclient "Play PlaneShift"

	games_make_wrapper pssetup "${GAMES_PREFIX_OPT}/PlaneShift/pssetup"
	make_desktop_entry pssetup "PlaneShift setup"
}

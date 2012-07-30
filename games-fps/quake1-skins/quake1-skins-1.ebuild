# Copyright 1999-2006 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit eutils games

PAKFILE="x_dp_monsters.pk3"

DESCRIPTION="Improved monster skins for Quake 1"
HOMEPAGE="http://www.quakeexpo.com/booth.php?id=69"
SRC_URI="http://morphed.planetnexuiz.com/${PAKFILE}"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~x86"
IUSE=""

RDEPEND=""
DEPEND="app-arch/unzip"

S=${WORKDIR}
dir=${GAMES_DATADIR}/quake1

src_unpack() {
	echo ">>> Unpacking ${PAKFILE} to ${PWD}"
	unzip -qo "${DISTDIR}/${PAKFILE}" || die "unzip failed"
	mv progs/*.txt .
}

src_install() {
	local subdir="progs"

	insinto "${dir}/id1/${subdir}"
	doins "${subdir}"/* \
		|| die "doins * failed"

	# Set up symlink, for the demo levels to include the skins
	dosym "${dir}/id1/${subdir}" "${dir}/demo/${subdir}"

	dodoc *.txt

	prepgamesdirs
}

pkg_postinst() {
	games_pkg_postinst

	elog "Use a Quake 1 client (e.g. darkplaces) to take advantage of these."
	echo
}

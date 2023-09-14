# Copyright 1999-2006 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

inherit games

# "100" means "100% quick", rather than the version number.
# The menu in Qd100Q.zip doesn't work, so ignore that collection.

DESCRIPTION="Extremely fast runthrough demos of the official Quake 1 maps"
HOMEPAGE="http://speeddemosarchive.com/quake/qdq/"
SRC_URI="http://speeddemosarchive.com/quake/qdq/demos/qd100qwav-ep1.zip
	cdinstall? ( http://speeddemosarchive.com/quake/qdq/demos/Qd100Qr.zip )"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~x86"
IUSE="cdinstall"

# qd100qwav-ep1.zip by itself works with just the demo data
RDEPEND="|| (
		games-fps/darkplaces
		games-fps/joequake
		games-fps/tenebrae )
	cdinstall? ( games-fps/quake1-data )
	!cdinstall? ( || (
			games-fps/quake1-demodata
			games-fps/quake1-data ) )"
DEPEND="app-arch/unzip"

S=${WORKDIR}
dir=${GAMES_DATADIR}/quake1

src_unpack() {
	# Is episode 1 (i.e. demo data) only
	unpack qd100qwav-ep1.zip
	mkdir qd100qwav-ep1
	mv *.pak qd100qwav-ep1

	if use cdinstall ; then
		# Needs all 3 episodes from the CD installation
		unpack Qd100Qr.zip
		mkdir qd100qr
		mv *.PAK qd100qr
	fi

	# Fix filenames
	local d f fname lcfname
	for f in $(find . -type f) ; do
		fname=$(basename "${f}")
		lcfname=$(echo "${fname}" | tr [:upper:] [:lower:])
		if [[ "${lcfname}" != "${fname}" ]] ; then
			# Rename the file to lower-case
			d=$(dirname "${f}")
			mv "${f}" "${d}/${lcfname}"
		fi
	done
}

src_install() {
	insinto "${dir}"
	doins -r $(find . -maxdepth 1 -type d -name 'qd100*') || die "doins -r failed"

	dodoc *.txt

	prepgamesdirs
}

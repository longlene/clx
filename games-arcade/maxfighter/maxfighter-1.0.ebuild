# Copyright 1999-2006 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

inherit flag-o-matic games

MYSDL_PV="1.0"
MY_P=${PN}_${PV}

DESCRIPTION="Vertically-scrolling asteroids-style shoot-em-up"
HOMEPAGE="http://maxfighter.musgit.com/"
SRC_URI="http://source.musgit.com/files/mysdl_${MYSDL_PV}.tar.bz2
	http://source.musgit.com/files/${MY_P}.tar.bz2"

# See http://creativecommons.org/licenses/by-nc-sa/2.5/
LICENSE="CCPL-Attribution-NonCommercial-ShareAlike-2.5
	GPL-2"
KEYWORDS="~x86"
IUSE=""
SLOT="0"

RDEPEND="dev-util/scons
	virtual/opengl
	virtual/glu
	>=media-libs/libsdl-1.2
	>=media-libs/sdl-image-1.2
	media-libs/libpng
	dev-libs/expat
	>=media-libs/openal-0.0.8
	media-libs/libogg
	media-libs/libvorbis"
DEPEND="${RDEPEND}"

S=${WORKDIR}/${MY_P}
release=${S}/dist/linux/${PN}

src_unpack() {
	unpack ${A}

	# mysdl directory will be recognized by game compilation
	mv -f mysdl_${MYSDL_PV} mysdl || die "mv mysdl failed"

	# Change default march
	local march=$(get-flag -march)
	cd "${S}"
	sed -i \
		-e "s:-march=pentium:${march}:" \
		{,"${WORKDIR}"/mysdl/}SConstruct || die "sed SConstruct failed"
}

src_compile() {
	# Compile utility library
	cd "${WORKDIR}/mysdl"
	scons dist=1 || die "scons mysdl failed"

	# Compile game
	cd "${S}"
	scons dist=1 || die "scons ${MY_P} failed"
}

src_install() {
	local dir=${GAMES_DATADIR}/${PN}
	local state_dir=${GAMES_STATEDIR}/${PN}

	dogamesbin "${release}/${PN}" || die "dogamesbin failed"

	insinto "${dir}"
	doins -r "${release}"/resources/* || die "doins resources failed"

	dohtml -r "${release}"/docs/* || die "dohtml docs failed"

	# Use a suitable icon from the many images available
	newicon "${release}"/resources/images/player_1_0006.png ${PN}.png \
		|| die "newicon failed"
	make_desktop_entry ${PN} "Max Fighter" ${PN}.png

	# Shared highscores file
	dodir "${state_dir}"
	touch "${D}/${state_dir}"/highscores.xml || die "touch failed"
	fperms g+w "${state_dir}"/highscores.xml || die "fperms failed"

	prepgamesdirs
}

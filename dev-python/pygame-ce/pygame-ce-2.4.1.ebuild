# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_EXT=1
DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{11..12} pypy3 )

inherit distutils-r1

DESCRIPTION="pygame - Community Edition"
HOMEPAGE="https://github.com/pygame-community/pygame-ce"
SRC_URI="https://github.com/pygame-community/pygame-ce/archive/refs/tags/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="LGPL-2.1"
SLOT="0"
KEYWORDS="~amd64"
IUSE="examples opengl test X"

RESTRICT="!test? ( test )"

RDEPEND="
	dev-python/numpy[${PYTHON_USEDEP}]
	media-libs/freetype
	media-libs/libjpeg-turbo:=
	media-libs/libpng:=
	media-libs/portmidi
	media-libs/sdl2-image
	media-libs/sdl2-mixer
	media-libs/sdl2-ttf
	X? ( media-libs/libsdl2[opengl?,threads,video,X] )
	!X? ( media-libs/libsdl2[threads] )
"
DEPEND="
	${RDEPEND}
	test? (
		media-libs/sdl2-image[gif,jpeg,png,tiff,webp]
		media-libs/sdl2-mixer[mp3,vorbis,wav]
	)
"
RDEPEND+="
	media-libs/fontconfig
"

BDEPEND="
	dev-python/cython[${PYTHON_USEDEP}]
	test? (
		media-libs/fontconfig
		sys-apps/util-linux
	)
"

python_configure() {
	PORTMIDI_INC_PORTTIME=1 LOCALBASE="${EPREFIX}/usr" \
		"${EPYTHON}" "${S}"/buildconfig/config.py || die
}

python_configure_all() {
	find src_c/cython -name '*.pyx' -exec touch {} + || die
	"${EPYTHON}" setup.py cython_only || die
}

python_test() {
	local -x PYTHONPATH=${BUILD_DIR}/install/lib
	local -x SDL_VIDEODRIVER=dummy
	local -x SDL_AUDIODRIVER=disk
	script -eqc "${EPYTHON} -m pygame.tests -v" || die
}

python_install() {
	distutils-r1_python_install
	rm -fr "${D}$(python_get_sitedir)"/pygame/{docs,examples,tests}/ || die
}

python_install_all() {
	distutils-r1_python_install_all
	use examples && dodoc -r examples
}

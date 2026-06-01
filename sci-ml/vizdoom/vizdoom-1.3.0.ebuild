# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{13..14} )

inherit distutils-r1

DESCRIPTION="Doom-based AI Research Platform for Reinforcement Learning from Raw Visual"
HOMEPAGE="https://vizdoom.farama.org https://github.com/Farama-Foundation/ViZDoom"
SRC_URI="https://github.com/Farama-Foundation/ViZDoom/archive/${PV}.tar.gz -> ${P}.gh.tar.gz"

S="${WORKDIR}"/ViZDoom-${PV}
LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
RESTRICT="test"

DEPEND="
	dev-libs/boost:=
	media-libs/libsdl2
	media-libs/openal
	media-libs/libsndfile
	media-sound/mpg123
	media-sound/fluidsynth
	app-arch/bzip2
	virtual/zlib
	media-libs/libjpeg-turbo
"
RDEPEND="${DEPEND}
	dev-python/numpy[${PYTHON_USEDEP}]
	dev-python/pygame-ce[${PYTHON_USEDEP}]
"
BDEPEND="
	dev-build/cmake
	dev-python/pybind11[${PYTHON_USEDEP}]
"

src_prepare() {
	# Fix hardcoded /usr/local/share/ to FHS-compliant /usr/share/
	sed -e 's#/usr/local/share/#/usr/share/#g' \
		-i src/vizdoom/src/posix/i_system.h || die
	# Fix WAD search paths to standard Gentoo locations
	sed -e 's#/usr/local/share/doom#/usr/share/doom#g' \
		-e 's#/usr/local/share/games/doom#/usr/share/games/doom#g' \
		-i src/vizdoom/src/gameconfigfile.cpp || die
	# The source tarball has CRLF line endings; normalize before patching
	sed -i 's/\r//' src/lib_python/CMakeLists.txt || die
	# pybind11 is a git submodule not included in the release tarball; replace
	# submodule detection + add_subdirectory with find_package(pybind11)
	eapply "${FILESDIR}"/vizdoom-1.3.0-pybind11-system.patch
	distutils-r1_src_prepare
}

python_compile() {
	# setup.py invokes cmake internally; disable RPATH so installed files use
	# the system linker path instead of build-dir paths
	VIZDOOM_CMAKE_ARGS="-DCMAKE_SKIP_RPATH=ON" \
		distutils-r1_python_compile
}

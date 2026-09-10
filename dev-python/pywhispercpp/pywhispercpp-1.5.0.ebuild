# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{13..15} )

inherit distutils-r1

DESCRIPTION="Python bindings for whisper.cpp"
HOMEPAGE="https://github.com/absadiki/pywhispercpp"
SRC_URI="https://github.com/absadiki/pywhispercpp/archive/refs/tags/v${PV}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

IUSE="examples gui"

RDEPEND="
	app-accessibility/whisper-cpp
	dev-python/numpy[${PYTHON_USEDEP}]
	dev-python/platformdirs[${PYTHON_USEDEP}]
	dev-python/requests[${PYTHON_USEDEP}]
	dev-python/tqdm[${PYTHON_USEDEP}]
	examples? (
		dev-python/sounddevice[${PYTHON_USEDEP}]
		dev-python/webrtcvad[${PYTHON_USEDEP}]
	)
	gui? ( dev-python/PyQt5[${PYTHON_USEDEP}] )
"
DEPEND="
	app-accessibility/whisper-cpp
	dev-python/pybind11[${PYTHON_USEDEP}]
"
BDEPEND="
	dev-build/cmake
	dev-python/setuptools-scm
"

# pywhispercpp vendors pybind11 and whisper.cpp as git submodules, which are
# empty in a GitHub tag archive (submodule content isn't included). Both
# projects export proper CMake package configs, and whisper.cpp is already
# packaged as app-accessibility/whisper-cpp, so link against the system
# copies instead of trying to vendor two large C++ trees via SRC_URI.
src_prepare() {
	sed -i \
		-e '/add_subdirectory(pybind11)/s/.*/find_package(pybind11 REQUIRED)/' \
		-e '/add_subdirectory(whisper.cpp)/s/.*/find_package(whisper REQUIRED)/' \
		CMakeLists.txt || die

	export SETUPTOOLS_SCM_PRETEND_VERSION=${PV}
	distutils-r1_src_prepare
}

python_compile() {
	local cmakedir
	cmakedir=$("${EPYTHON}" -c 'import pybind11; print(pybind11.get_cmake_dir())') || die
	CMAKE_ARGS="-Dpybind11_DIR=${cmakedir}" distutils-r1_python_compile
}

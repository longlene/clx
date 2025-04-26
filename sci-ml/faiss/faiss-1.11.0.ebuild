# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_EXT=1
DISTUTILS_OPTIONAL=1
DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{11..13} )

inherit cmake distutils-r1

DESCRIPTION="A library for efficient similarity search and clustering of dense vectors"
HOMEPAGE="
	https://github.com/facebookresearch/faiss
	https://faiss.ai/
"
SRC_URI="https://github.com/facebookresearch/faiss/archive/refs/tags/v${PV}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE="cuda mkl python rocm"

DEPEND=""
RDEPEND="${DEPEND}
	python? (
		${PYTHON_DEPS}
		dev-python/numpy[${PYTHON_USEDEP}]
		dev-python/packaging[${PYTHON_USEDEP}]
	)
"
BDEPEND="
	python? (
		${PYTHON_DEPS}
		${DISTUTILS_DEPS}
	)
"
REQUIRED_USE="
	python? ( ${PYTHON_REQUIRED_USE} )
"

RESTRICT="test"
CMAKE_IN_SOURCE_BUILD=1

wrap_python() {
	if use python; then
		local phase=$1
		pushd faiss/python >/dev/null || die
		distutils-r1_${phase} "$@"
		popd >/dev/null || die
	fi
}

pkg_setup() {
	python_setup
}

src_prepare() {
	cmake_src_prepare
	wrap_python ${FUNCNAME}
}

src_configure() {
	local gpu=OFF
	use cuda && gpu=ON
	use rocm && gpu=ON
	local mycmakeargs=(
		-DFAISS_ENABLE_GPU=${gpu}
		-DFAISS_ENABLE_ROCM=$(usex rocm)
		-DFAISS_ENABLE_MKL=$(usex mkl)
		-DFAISS_ENABLE_EXTRAS=OFF
		-DFAISS_ENABLE_PYTHON=$(usex python)
		-DBUILD_TESTING=OFF
	)
	cmake_src_configure
	wrap_python ${FUNCNAME}
}

src_compile() {
	cmake_src_compile
	wrap_python ${FUNCNAME}
}

src_install() {
	cmake_src_install
	wrap_python ${FUNCNAME}
}

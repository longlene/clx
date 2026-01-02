# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_EXT=1
DISTUTILS_OPTIONAL=1
DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{13..14} )

inherit cmake distutils-r1

DESCRIPTION="Smaller & Faster Single-File Vector Search Engine from Unum"
HOMEPAGE="
	https://pypi.org/project/usearch/
"
SRC_URI="https://github.com/unum-cloud/USearch/archive/refs/tags/v${PV}.tar.gz -> ${P}.gh.tar.gz"

LICENSE=""
SLOT="0"
KEYWORDS="~amd64"
IUSE="python"

DEPEND="
	dev-libs/simsimd
"
RDEPEND="${DEPEND}
	python? ( ${PYTHON_DEPS} )
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

EPYTEST_PLUGINS=()
distutils_enable_tests pytest

S="${WORKDIR}"/USearch-${PV}

wrap_python() {
	local phase=$1
	if use python; then
		distutils-r1_${phase} "$@"
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
	local mycmakeargs=(
		-DUSEARCH_INSTALL=ON
		-DUSEARCH_BUILD_TEST_CPP=OFF
		-DUSEARCH_BUILD_BENCH_CPP=OFF
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

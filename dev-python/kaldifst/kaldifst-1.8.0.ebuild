# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_EXT=1
DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{13..15} )

inherit distutils-r1 pypi

OPENFST_TAG="1.8.5-2026-04-10"

DESCRIPTION="Python wrapper for OpenFST and its extensions from Kaldi"
HOMEPAGE="
	https://pypi.org/project/kaldifst/
	https://github.com/k2-fsa/kaldifst
"
SRC_URI="
	https://github.com/k2-fsa/kaldifst/archive/refs/tags/v${PV}.tar.gz -> ${P}.gh.tar.gz
	https://github.com/csukuangfj/openfst/archive/refs/tags/v${OPENFST_TAG}.tar.gz -> openfst-${OPENFST_TAG}.gh.tar.gz
"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

RESTRICT="test"

BDEPEND="
	$(python_gen_cond_dep '
		dev-python/pybind11[${PYTHON_USEDEP}]
	')
"

PATCHES=(
	"${FILESDIR}"/use-system-pybind11.patch
)

python_compile() {
	# Pass Python3_EXECUTABLE so pybind11 3.0's new-mode FindPython uses the right interp
	KALDIFST_CMAKE_ARGS="-DPython3_EXECUTABLE=${PYTHON}" \
		distutils-r1_python_compile
}

src_prepare() {
	# cmake/openfst.cmake checks ${CMAKE_SOURCE_DIR}/openfst-TAG.tar.gz as a
	# fallback before downloading; placing the pre-fetched tarball there
	# avoids all network access during the build.
	cp "${DISTDIR}"/openfst-${OPENFST_TAG}.gh.tar.gz "${S}"/openfst-${OPENFST_TAG}.tar.gz || die
	distutils-r1_src_prepare
}

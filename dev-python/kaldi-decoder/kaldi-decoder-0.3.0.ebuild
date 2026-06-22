# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_EXT=1
DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{13..15} )

inherit distutils-r1

KALDIFST_PV="1.8.0"
OPENFST_TAG="1.8.5-2026-04-10"
EIGEN_PV="3.4.0"

DESCRIPTION="Decoders from Kaldi using OpenFst"
HOMEPAGE="https://github.com/k2-fsa/kaldi-decoder"
SRC_URI="
	https://github.com/k2-fsa/kaldi-decoder/archive/refs/tags/v${PV}.tar.gz -> ${P}.gh.tar.gz
	https://github.com/k2-fsa/kaldifst/archive/refs/tags/v${KALDIFST_PV}.tar.gz -> kaldifst-${KALDIFST_PV}.tar.gz
	https://github.com/csukuangfj/openfst/archive/refs/tags/v${OPENFST_TAG}.tar.gz -> openfst-${OPENFST_TAG}.tar.gz
	https://gitlab.com/libeigen/eigen/-/archive/${EIGEN_PV}/eigen-${EIGEN_PV}.tar.gz
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
	KALDI_DECODER_CMAKE_ARGS="-DPython3_EXECUTABLE=${PYTHON}" \
		distutils-r1_python_compile
}

src_prepare() {
	# cmake's possible_file_locations checks ${CMAKE_SOURCE_DIR} (= ${S})
	# for pre-downloaded tarballs, avoiding network access during build.
	# This also works for nested builds (kaldifst's openfst.cmake checks
	# CMAKE_SOURCE_DIR which remains the top-level kaldi-decoder source dir).
	cp "${DISTDIR}"/kaldifst-${KALDIFST_PV}.tar.gz "${S}"/kaldifst-${KALDIFST_PV}.tar.gz || die
	cp "${DISTDIR}"/openfst-${OPENFST_TAG}.tar.gz "${S}"/openfst-${OPENFST_TAG}.tar.gz || die
	cp "${DISTDIR}"/eigen-${EIGEN_PV}.tar.gz "${S}"/eigen-${EIGEN_PV}.tar.gz || die
	distutils-r1_src_prepare
}

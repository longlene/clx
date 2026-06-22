# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_EXT=1
DISTUTILS_SINGLE_IMPL=1
DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{13..15} )

inherit distutils-r1

DESCRIPTION="Efficient Training for Big Models using distributed and memory-saving techniques"
HOMEPAGE="https://github.com/OpenBMB/BMTrain"
SRC_URI="https://github.com/OpenBMB/BMTrain/archive/refs/tags/v${PV}.tar.gz -> ${P}.gh.tar.gz"
S="${WORKDIR}/BMTrain-${PV}"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"
RESTRICT="test"

QA_PRESTRIPPED="usr/lib/python.*/site-packages/bmtrain/C\.cpython-.*\.so"

DEPEND="
	>=sci-ml/pytorch-2.0.0[${PYTHON_SINGLE_USEDEP}]
	dev-libs/nccl
"
RDEPEND="
	${DEPEND}
	$(python_gen_cond_dep '
		dev-python/numpy[${PYTHON_USEDEP}]
	')
"
BDEPEND="
	$(python_gen_cond_dep '
		dev-python/pybind11[${PYTHON_USEDEP}]
	')
"

src_prepare() {
	eapply "${FILESDIR}"/${P}-cuda-arch.patch
	eapply "${FILESDIR}"/${P}-avx512-guard.patch
	distutils-r1_src_prepare
}

python_compile() {
	local -x CMAKE_ARGS="-DNCCL_INCLUDE_DIR=/usr/include -DNCCL_LIB_DIR=/usr/lib64 --no-warn-unused-cli"
	distutils-r1_python_compile
}

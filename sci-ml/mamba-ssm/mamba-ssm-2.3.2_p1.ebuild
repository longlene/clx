# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_EXT=1
DISTUTILS_SINGLE_IMPL=1
DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{13..15} )

inherit distutils-r1

MY_PV="2.3.2.post1"

DESCRIPTION="Mamba state-space model"
HOMEPAGE="https://github.com/state-spaces/mamba"
SRC_URI="https://github.com/state-spaces/mamba/archive/refs/tags/v${MY_PV}.tar.gz -> ${P}.gh.tar.gz"

S="${WORKDIR}/mamba-${MY_PV}"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	>=sci-ml/pytorch-2.0.0[${PYTHON_SINGLE_USEDEP}]
	sci-ml/transformers[${PYTHON_SINGLE_USEDEP}]
	>=dev-python/tilelang-0.1.8[${PYTHON_SINGLE_USEDEP}]
	sci-ml/apache-tvm-ffi[${PYTHON_SINGLE_USEDEP}]
	>=sci-ml/quack-kernels-0.3.4[${PYTHON_SINGLE_USEDEP}]
	$(python_gen_cond_dep '
		>=dev-python/triton-3.5.0[${PYTHON_USEDEP}]
		dev-python/einops[${PYTHON_USEDEP}]
		dev-python/packaging[${PYTHON_USEDEP}]
		dev-python/ninja[${PYTHON_USEDEP}]
	')
"
BDEPEND="
	dev-util/nvidia-cuda-toolkit
	$(python_gen_cond_dep '
		>=dev-python/setuptools-61.0.0[${PYTHON_USEDEP}]
	')
"
RESTRICT="test"

# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_EXT=1
DISTUTILS_SINGLE_IMPL=1
DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{13..15} )

inherit distutils-r1

MY_PV="1.6.2.post1"

DESCRIPTION="Causal depthwise conv1d in CUDA, with a PyTorch interface"
HOMEPAGE="https://github.com/Dao-AILab/causal-conv1d"
SRC_URI="https://github.com/Dao-AILab/causal-conv1d/archive/refs/tags/v${MY_PV}.tar.gz -> ${P}.gh.tar.gz"

S="${WORKDIR}/causal-conv1d-${MY_PV}"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	>=sci-ml/pytorch-2.0.0[${PYTHON_SINGLE_USEDEP}]
	$(python_gen_cond_dep '
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

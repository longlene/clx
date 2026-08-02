# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_SINGLE_IMPL=1
DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{13..15} )

inherit distutils-r1

DESCRIPTION="PyTorch model compression and optimization for deployment via Core AI"
HOMEPAGE="https://github.com/apple/coreai-optimization"
SRC_URI="https://github.com/apple/coreai-optimization/archive/refs/tags/v${PV}.tar.gz -> ${P}.gh.tar.gz"
S="${WORKDIR}/coreai-optimization-${PV}"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64"
IUSE="coreai"
RESTRICT="test"

RDEPEND="
	>=sci-ml/pytorch-2.8.0[${PYTHON_SINGLE_USEDEP}]
	dev-python/coremltools[${PYTHON_SINGLE_USEDEP}]
	sci-ml/torchao[${PYTHON_SINGLE_USEDEP}]
	coreai? (
		sci-ml/coreai-core[${PYTHON_SINGLE_USEDEP}]
		sci-ml/coreai-torch[${PYTHON_SINGLE_USEDEP}]
		dev-python/scikit-learn[${PYTHON_SINGLE_USEDEP}]
	)
	$(python_gen_cond_dep '
		>=dev-python/numpy-2.0[${PYTHON_USEDEP}]
		>=dev-python/pydantic-2.0.0[${PYTHON_USEDEP}]
		>=dev-python/rich-13.0.0[${PYTHON_USEDEP}]
		>=sci-ml/safetensors-0.5.3[${PYTHON_USEDEP}]
		>=dev-python/tqdm-4.65[${PYTHON_USEDEP}]
	')
"

# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_SINGLE_IMPL=1
DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{13..15} )

inherit distutils-r1

DESCRIPTION="Model compression toolkit for large language models"
HOMEPAGE="https://github.com/Tencent/AngelSlim"
SRC_URI="https://github.com/Tencent/AngelSlim/archive/refs/tags/v${PV}.tar.gz -> ${P}.gh.tar.gz"
S="${WORKDIR}/AngelSlim-${PV}"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

IUSE="eval"

RDEPEND="
	>=sci-ml/pytorch-2.6.0[${PYTHON_SINGLE_USEDEP}]
	sci-ml/torchvision[${PYTHON_SINGLE_USEDEP}]
	>=sci-ml/transformers-5.2.0[${PYTHON_SINGLE_USEDEP}]
	sci-ml/datasets[${PYTHON_SINGLE_USEDEP}]
	sci-ml/accelerate[${PYTHON_SINGLE_USEDEP}]
	eval? ( sci-ml/lm-eval[${PYTHON_SINGLE_USEDEP}] )
	$(python_gen_cond_dep '
		>=sci-ml/safetensors-0.5.3[${PYTHON_USEDEP}]
		dev-python/numpy[${PYTHON_USEDEP}]
		dev-python/tqdm[${PYTHON_USEDEP}]
		dev-python/triton[${PYTHON_USEDEP}]
		dev-python/pyarrow[${PYTHON_USEDEP}]
		dev-python/tiktoken[${PYTHON_USEDEP}]
		dev-python/threadpoolctl[${PYTHON_USEDEP}]
		dev-python/shortuuid[${PYTHON_USEDEP}]
		dev-python/ray[${PYTHON_USEDEP}]
	')
"
DEPEND="${RDEPEND}"

src_prepare() {
	# upstream derives the version from `git branch`/`git tag` (fails outside
	# a git checkout) and appends the build host's CUDA/torch version as a
	# local segment; pin it to PV instead for a reproducible package version
	sed -i \
		-e 's/^TOOLS_VERSION = get_version_with_cuda_torch()$/TOOLS_VERSION = "'"${PV}"'"/' \
		setup.py || die
	distutils-r1_src_prepare
}

distutils_enable_tests pytest

# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_SINGLE_IMPL=1
DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{11..14} )

inherit distutils-r1

DESCRIPTION="Training workbench to make your model glow"
HOMEPAGE="https://github.com/modelscope/twinkle"
SRC_URI="https://github.com/modelscope/twinkle/archive/refs/tags/v${PV}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"
IUSE="ray train vllm"
RESTRICT="test"

RDEPEND="
	sci-ml/peft[${PYTHON_SINGLE_USEDEP}]
	sci-ml/transformers[${PYTHON_SINGLE_USEDEP}]
	sci-ml/datasets[${PYTHON_SINGLE_USEDEP}]
	$(python_gen_cond_dep '
		>=sci-ml/modelscope-1.34.0[${PYTHON_USEDEP}]
		>=dev-python/numpy-2.0.0[${PYTHON_USEDEP}]
		dev-python/fastapi[${PYTHON_USEDEP}]
		dev-python/omegaconf[${PYTHON_USEDEP}]
		sci-ml/safetensors[${PYTHON_USEDEP}]
	')
	ray? (
		$(python_gen_cond_dep '
			dev-python/ray[${PYTHON_USEDEP}]
		')
	)
	train? (
		sci-ml/accelerate[${PYTHON_SINGLE_USEDEP}]
		>=sci-ml/pytorch-2.6.0[${PYTHON_SINGLE_USEDEP}]
		sci-ml/torchvision[${PYTHON_SINGLE_USEDEP}]
	)
	vllm? (
		>=sci-ml/vllm-0.11[${PYTHON_SINGLE_USEDEP}]
	)
"
BDEPEND="$(python_gen_cond_dep '
	dev-python/setuptools[${PYTHON_USEDEP}]
')"

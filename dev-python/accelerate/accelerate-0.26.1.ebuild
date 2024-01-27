# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_1{1..2} )

inherit distutils-r1

DESCRIPTION="A simple way to train and use PyTorch models with multi-GPU, TPU, mixed-precision"
HOMEPAGE="https://github.com/huggingface/accelerate"
SRC_URI="https://github.com/huggingface/accelerate/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	>=dev-python/numpy-1.17[${PYTHON_USEDEP}]
	>=dev-python/packaging-20.0[${PYTHON_USEDEP}]
	dev-python/psutil[${PYTHON_USEDEP}]
	dev-python/pyyaml[${PYTHON_USEDEP}]
	>=sci-libs/pytorch-1.10.0[${PYTHON_USEDEP}]
	dev-python/huggingface_hub[${PYTHON_USEDEP}]
	>=dev-python/safetensors-0.3.1[${PYTHON_USEDEP}]
"
BDEPEND=""

RESTRICT="test"

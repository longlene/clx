# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=hatchling
PYTHON_COMPAT=( python3_1{1..2} )

inherit distutils-r1

DESCRIPTION="State-of-the-art Parameter-Efficient Fine-Tuning"
HOMEPAGE="https://github.com/huggingface/peft"
SRC_URI="https://github.com/huggingface/peft/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	>=dev-python/numpy-1.17[${PYTHON_USEDEP}]
	>=dev-python/packaging-20.0[${PYTHON_USEDEP}]
	dev-python/psutil[${PYTHON_USEDEP}]
	dev-python/pyyaml[${PYTHON_USEDEP}]
	>=sci-libs/pytorch-1.13.0[${PYTHON_USEDEP}]
	dev-python/transformers[${PYTHON_USEDEP}]
	dev-python/tqdm[${PYTHON_USEDEP}]
	>=dev-python/accelerate-0.21.0[${PYTHON_USEDEP}]
	dev-python/safetensors[${PYTHON_USEDEP}]
	>=dev-python/huggingface_hub-0.17.0[${PYTHON_USEDEP}]
"
BDEPEND=""

RESTRICT="test"

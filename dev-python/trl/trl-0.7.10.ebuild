# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_1{1..2} )

inherit distutils-r1

DESCRIPTION="Train transformer language models with reinforcement learning"
HOMEPAGE="https://github.com/huggingface/trl"
SRC_URI="https://github.com/huggingface/trl/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	>=dev-python/datasets-1.17.0[${PYTHON_USEDEP}]
	>=sci-libs/pytorch-1.4.0[${PYTHON_USEDEP}]
	>=dev-python/transformers-4.31.0[${PYTHON_USEDEP}]
	dev-python/accelerate[${PYTHON_USEDEP}]
	>=dev-python/peft-0.3.0[${PYTHON_USEDEP}]
	>=dev-python/tyro-0.5.11[${PYTHON_USEDEP}]
"
BDEPEND=""

RESTRICT="test"

src_prepare() {
	default
	rm -rf tests
}




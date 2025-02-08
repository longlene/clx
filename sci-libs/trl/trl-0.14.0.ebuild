# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_SINGLE_IMPL=1
DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{11..13} )

inherit distutils-r1

DESCRIPTION="Train transformer language models with reinforcement learning"
HOMEPAGE="https://github.com/huggingface/trl"
SRC_URI="https://github.com/huggingface/trl/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	>=sci-libs/accelerate-0.34.0[${PYTHON_SINGLE_USEDEP}]
	>=sci-libs/datasets-2.21.0[${PYTHON_SINGLE_USEDEP}]
	$(python_gen_cond_dep '
		dev-python/rich[${PYTHON_USEDEP}]
	')
	>=sci-libs/transformers-4.46.0[${PYTHON_SINGLE_USEDEP}]
"
BDEPEND=""

RESTRICT="test"

src_prepare() {
	default
	rm -rf tests
}




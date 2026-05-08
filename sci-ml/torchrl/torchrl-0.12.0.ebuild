# Copyright 2025 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_EXT=1
DISTUTILS_SINGLE_IMPL=1
DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{11..14} )

inherit distutils-r1

DESCRIPTION="A modular, primitive-first, python-first PyTorch library for Reinforcement Learning"
HOMEPAGE="
	https://pytorch.org/rl
	https://github.com/pytorch/rl
"
SRC_URI="https://github.com/pytorch/rl/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	>=sci-ml/pytorch-2.5.0[${PYTHON_SINGLE_USEDEP}]
	$(python_gen_cond_dep '
		dev-python/pyvers[${PYTHON_USEDEP}]
		dev-python/numpy[${PYTHON_USEDEP}]
		dev-python/packaging[${PYTHON_USEDEP}]
		dev-python/cloudpickle[${PYTHON_USEDEP}]
		>=sci-ml/tensordict-0.10.0[${PYTHON_USEDEP}]
	')
"

RESTRICT="test"

S="${WORKDIR}"/rl-${PV}

src_prepare() {
	default
	rm -rf benchmarks
	distutils-r1_src_prepare
}


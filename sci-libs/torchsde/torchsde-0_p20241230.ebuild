# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_SINGLE_IMPL=1
DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{11..13} )

inherit distutils-r1

EGIT_COMMIT="eb3a00e31cbd56176270066ed2f62c394cf6acb7"

DESCRIPTION="SDE solvers and stochastic adjoint sensitivity analysis in PyTorch"
HOMEPAGE="https://github.com/google-research/torchsde"
SRC_URI="https://github.com/google-research/torchsde/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}
	>=sci-libs/pytorch-1.6.0[${PYTHON_SINGLE_USEDEP}]
	$(python_gen_cond_dep '
		>=dev-python/numpy-1.19[${PYTHON_USEDEP}]
		>=dev-python/scipy-1.5[${PYTHON_USEDEP}]
		>=dev-python/trampoline-0.1.2[${PYTHON_USEDEP}]
	')
"
BDEPEND=""

RESTRICT="test"

S="${WORKDIR}"/${PN}-${EGIT_COMMIT}

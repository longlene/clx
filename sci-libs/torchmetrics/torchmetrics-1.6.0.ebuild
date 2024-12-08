# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_SINGLE_IMPL=1
DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12..13} )

inherit distutils-r1

DESCRIPTION="Machine learning metrics for distributed, scalable PyTorch applications"
HOMEPAGE="https://github.com/Lightning-AI/torchmetrics"
SRC_URI="https://github.com/Lightning-AI/torchmetrics/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	>=sci-libs/pytorch-2.1.0[${PYTHON_SINGLE_USEDEP}]
	>=sci-libs/lightning-utilities-0.8.0[${PYTHON_SINGLE_USEDEP}]
	$(python_gen_cond_dep '
		>=dev-python/numpy-1.20.0[${PYTHON_USEDEP}]
		>=dev-python/packaging-17.1[${PYTHON_USEDEP}]
	')
"
#BDEPEND="
#	test? (
#	)
#"
#
distutils_enable_tests pytest


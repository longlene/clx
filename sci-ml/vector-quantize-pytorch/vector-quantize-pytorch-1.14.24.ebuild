# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=hatchling
PYTHON_COMPAT=( python3_{11..13} )

inherit distutils-r1

DESCRIPTION="Vector (and Scalar) Quantization, in Pytorch"
HOMEPAGE="https://github.com/lucidrains/vector-quantize-pytorch"
SRC_URI="https://github.com/lucidrains/vector-quantize-pytorch/archive/refs/tags/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	>=sci-ml/pytorch-2.0[${PYTHON_USEDEP}]
	>=dev-python/einops-0.8.0[${PYTHON_USEDEP}]
	>=dev-python/einx-0.2.2[${PYTHON_USEDEP}]
"
BDEPEND="
	test? (
		>=dev-python/ruff-0.4.2[${PYTHON_USEDEP}]
		>=dev-python/pytest-8.2.0[${PYTHON_USEDEP}]
		>=dev-python/pytest-cov-5.0.0[${PYTHON_USEDEP}]
	)
"

distutils_enable_tests pytest

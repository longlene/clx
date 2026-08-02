# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_EXT=1
DISTUTILS_SINGLE_IMPL=1
DISTUTILS_USE_PEP517=scikit-build-core
PYTHON_COMPAT=( python3_{13..15} )

inherit distutils-r1

DESCRIPTION="Efficient, Flexible and Portable Structured Generation"
HOMEPAGE="
	https://github.com/mlc-ai/xgrammar
	https://xgrammar.mlc.ai/
"
SRC_URI="https://github.com/mlc-ai/xgrammar/archive/refs/tags/v${PV}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	>=sci-ml/pytorch-1.10.0[${PYTHON_SINGLE_USEDEP}]
	>=sci-ml/transformers-4.38.0[${PYTHON_SINGLE_USEDEP}]
	$(python_gen_cond_dep '
		>=sci-ml/tvm-ffi-0.1.9[${PYTHON_USEDEP}]
		dev-python/triton[${PYTHON_USEDEP}]
		dev-python/pydantic[${PYTHON_USEDEP}]
		dev-python/numpy[${PYTHON_USEDEP}]
		>=dev-python/typing-extensions-4.9.0[${PYTHON_USEDEP}]
	')
"
BDEPEND="
	$(python_gen_cond_dep '
		>=sci-ml/tvm-ffi-0.1.9[${PYTHON_USEDEP}]
	')
"

RESTRICT="test"

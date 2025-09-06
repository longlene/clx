# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_EXT=1
DISTUTILS_SINGLE_IMPL=1
DISTUTILS_USE_PEP517=scikit-build-core
PYTHON_COMPAT=( python3_{13..14} )

inherit distutils-r1

DESCRIPTION="Efficient, Flexible and Portable Structured Generation"
HOMEPAGE="
	https://github.com/mlc-ai/xgrammar
	https://xgrammar.mlc.ai/
"
SRC_URI="https://github.com/mlc-ai/xgrammar/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}
	>=sci-ml/pytorch-1.10.0[${PYTHON_SINGLE_USEDEP}]
	>=sci-ml/transformers-4.38.0[${PYTHON_SINGLE_USEDEP}]
	dev-python/triton-bin[${PYTHON_SINGLE_USEDEP}]
	$(python_gen_cond_dep '
		dev-python/pydantic[${PYTHON_USEDEP}]
		|| (
			sci-ml/pysentencepiece[${PYTHON_USEDEP}]
			sci-ml/sentencepiece[python,${PYTHON_USEDEP}]
		)
		dev-python/tiktoken[${PYTHON_USEDEP}]
		dev-python/ninja[${PYTHON_USEDEP}]
	')
"
BDEPEND="
	sci-libs/dlpack
	$(python_gen_cond_dep '
		>=dev-python/nanobind-2.5.0[${PYTHON_USEDEP}]
	')
"

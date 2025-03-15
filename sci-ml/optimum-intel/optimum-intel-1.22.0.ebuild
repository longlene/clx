# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_SINGLE_IMPL=1
DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{11..13} )

inherit distutils-r1

DESCRIPTION="Accelerate inference with Intel optimization tools"
HOMEPAGE="
	https://github.com/huggingface/optimum-intel
"
SRC_URI="https://github.com/huggingface/optimum-intel/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	>=sci-ml/pytorch-1.11.0[${PYTHON_SINGLE_USEDEP}]
	>=sci-ml/optimum-1.24.0[${PYTHON_SINGLE_USEDEP}]
	>=sci-ml/transformers-4.36.0[${PYTHON_SINGLE_USEDEP}]
	$(python_gen_cond_dep '
		>=sci-ml/datasets-1.4.0[${PYTHON_SINGLE_USEDEP}]
		sci-ml/sentencepiece[python,${PYTHON_USEDEP}]
		dev-python/scipy[${PYTHON_USEDEP}]
		sci-ml/onnx[${PYTHON_USEDEP}]
	')
"
#BDEPEND="
#	test? (
#	)
#"

distutils_enable_tests pytest

PATCHES=(
	"${FILESDIR}"/cli-fix.patch
)

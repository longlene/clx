# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_SINGLE_IMPL=1
DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{11..14} )

inherit distutils-r1

DESCRIPTION="Export your model to ONNX and run inference with ONNX Runtime"
HOMEPAGE="
	https://github.com/huggingface/optimum-onnx
"
SRC_URI="https://github.com/huggingface/optimum-onnx/archive/refs/tags/v${PV}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	>=sci-libs/optimum-2.1.0[${PYTHON_SINGLE_USEDEP}]
	>=sci-libs/transformers-4.36.0[${PYTHON_SINGLE_USEDEP}]
	$(python_gen_cond_dep '
		sci-ml/onnx[${PYTHON_USEDEP}]
	')
"
#BDEPEND="
#	test? (
#	)
#"

distutils_enable_tests pytest

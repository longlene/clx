# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_SINGLE_IMPL=1
DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{13..15} )

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
	>=sci-ml/pytorch-2.1.0[${PYTHON_SINGLE_USEDEP}]
	>=sci-ml/optimum-2.2.0[${PYTHON_SINGLE_USEDEP}]
	>=sci-ml/transformers-4.45.0[${PYTHON_SINGLE_USEDEP}]
	>=sci-ml/huggingface_hub-0.23.2[${PYTHON_SINGLE_USEDEP}]
	>=sci-ml/nncf-2.19.0[${PYTHON_SINGLE_USEDEP}]
	>=sci-ml/openvino-2026[python,${PYTHON_SINGLE_USEDEP}]
	>=sci-ml/openvino-tokenizers-2026[python,${PYTHON_SINGLE_USEDEP}]
	$(python_gen_cond_dep '
		<sci-ml/safetensors-0.8.0[${PYTHON_USEDEP}]
		>=dev-python/requests-2.33[${PYTHON_USEDEP}]
	')
"

distutils_enable_tests pytest

PATCHES=(
	"${FILESDIR}"/cli-fix.patch
)

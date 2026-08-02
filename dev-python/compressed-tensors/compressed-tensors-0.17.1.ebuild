# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_SINGLE_IMPL=1
DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{13..15} )

inherit distutils-r1

DESCRIPTION="A safetensors extension to efficiently store sparse quantized tensors on disk"
HOMEPAGE="
	https://pypi.org/project/compressed-tensors/
	https://github.com/vllm-project/compressed-tensors
"
SRC_URI="https://github.com/vllm-project/compressed-tensors/archive/refs/tags/${PV}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	>=sci-ml/pytorch-2.10.0[${PYTHON_SINGLE_USEDEP}]
	sci-ml/transformers[${PYTHON_SINGLE_USEDEP}]
	$(python_gen_cond_dep '
		>=dev-python/pydantic-2.0[${PYTHON_USEDEP}]
		dev-python/loguru[${PYTHON_USEDEP}]
	')
"

RESTRICT="test"

export SETUPTOOLS_SCM_PRETEND_VERSION_FOR_COMPRESSED_TENSORS="${PV}"

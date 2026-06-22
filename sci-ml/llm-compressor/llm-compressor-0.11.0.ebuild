# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_SINGLE_IMPL=1
DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{13..15} )

inherit distutils-r1

DESCRIPTION="Library for applying compression algorithms to LLMs for vLLM deployment"
HOMEPAGE="https://docs.vllm.ai/projects/llm-compressor https://github.com/vllm-project/llm-compressor"
SRC_URI="https://github.com/vllm-project/llm-compressor/archive/refs/tags/${PV}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"
RESTRICT="test"

RDEPEND="
	sci-ml/accelerate[${PYTHON_SINGLE_USEDEP}]
	sci-ml/auto-round[${PYTHON_SINGLE_USEDEP}]
	sci-ml/datasets[${PYTHON_SINGLE_USEDEP}]
	>=sci-ml/pytorch-2.10.0[${PYTHON_SINGLE_USEDEP}]
	>=sci-ml/transformers-4.56.1[${PYTHON_SINGLE_USEDEP}]
	dev-python/compressed-tensors[${PYTHON_SINGLE_USEDEP}]
	$(python_gen_cond_dep '
		dev-python/loguru[${PYTHON_USEDEP}]
		>=dev-python/numpy-2.0[${PYTHON_USEDEP}]
		dev-python/pillow[${PYTHON_USEDEP}]
		>=dev-python/pyyaml-6.0.1[${PYTHON_USEDEP}]
		>=dev-python/requests-2.32.2[${PYTHON_USEDEP}]
		>=dev-python/tqdm-4.66.3[${PYTHON_USEDEP}]
	')
"

BDEPEND="
	$(python_gen_cond_dep '
		dev-python/setuptools-scm[${PYTHON_USEDEP}]
	')
"

export SETUPTOOLS_SCM_PRETEND_VERSION="${PV}"

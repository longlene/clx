# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_SINGLE_IMPL=1
DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{13..15} )

inherit distutils-r1

DESCRIPTION="Datacenter-scale LLM serving engine for the desktop"
HOMEPAGE="
	https://pypi.org/project/freetoken/
	https://github.com/FlashML-org/FreeToken
"
SRC_URI="https://github.com/FlashML-org/FreeToken/archive/refs/tags/v${PV}.tar.gz -> ${P}.gh.tar.gz"
S="${WORKDIR}/FreeToken-${PV}"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	>=sci-ml/pytorch-2.11[${PYTHON_SINGLE_USEDEP}]
	<sci-ml/pytorch-2.12[${PYTHON_SINGLE_USEDEP}]
	>=sci-ml/huggingface_hub-1.5[${PYTHON_SINGLE_USEDEP}]
	>=sci-ml/safetensors-0.6[${PYTHON_SINGLE_USEDEP}]
	>=sci-ml/transformers-5.5[${PYTHON_SINGLE_USEDEP}]
	>=sci-ml/tvm-ffi-0.1.13[${PYTHON_SINGLE_USEDEP}]
	$(python_gen_cond_dep '
		>=dev-python/einops-0.8[${PYTHON_USEDEP}]
		>=dev-python/fastapi-0.115[${PYTHON_USEDEP}]
		~dev-python/flashlib-0.3.0[${PYTHON_USEDEP}]
		>=dev-python/gguf-0.19[${PYTHON_USEDEP}]
		>=dev-python/msgpack-1.1[${PYTHON_USEDEP}]
		sci-ml/modelscope[${PYTHON_USEDEP}]
		>=dev-python/numpy-2.0[${PYTHON_USEDEP}]
		>=dev-python/openai-2.0[${PYTHON_USEDEP}]
		>=dev-python/partial-json-parser-0.2[${PYTHON_USEDEP}]
		>=dev-python/prompt-toolkit-3.0[${PYTHON_USEDEP}]
		>=dev-python/pydantic-2.9[${PYTHON_USEDEP}]
		>=dev-python/pyzmq-27[${PYTHON_USEDEP}]
		>=dev-python/tqdm-4.66[${PYTHON_USEDEP}]
		~dev-python/triton-3.6.0[${PYTHON_USEDEP}]
		>=dev-python/uvicorn-0.30[${PYTHON_USEDEP}]
	')
"
#BDEPEND="
#	test? (
#	)
#"

EPYTEST_PLUGINS=()
distutils_enable_tests pytest

# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_SINGLE_IMPL=1
DISTUTILS_USE_PEP517=hatchling
PYTHON_COMPAT=( python3_{13..14} )

inherit distutils-r1

DESCRIPTION="Async RL Training at Scale"
HOMEPAGE="https://github.com/PrimeIntellect-ai/prime-rl"
SRC_URI="https://github.com/PrimeIntellect-ai/prime-rl/archive/refs/tags/v${PV}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	>=sci-ml/datasets-4.0.0[${PYTHON_SINGLE_USEDEP}]
	>=sci-ml/liger-kernel-0.5.10[${PYTHON_SINGLE_USEDEP}]
	>=sci-ml/pytorch-2.9.0[${PYTHON_SINGLE_USEDEP}]
	>=sci-ml/torchdata-0.11.0[${PYTHON_SINGLE_USEDEP}]
	>=sci-ml/transformers-4.57.6[${PYTHON_SINGLE_USEDEP}]
	>=sci-ml/vllm-0.17.0[${PYTHON_SINGLE_USEDEP}]
	sci-ml/torchtitan[${PYTHON_SINGLE_USEDEP}]
	sci-ml/flash-linear-attention[${PYTHON_SINGLE_USEDEP}]
	dev-python/dion[${PYTHON_SINGLE_USEDEP}]
	>=dev-python/prime-0.5.37[${PYTHON_SINGLE_USEDEP}]
	>=dev-python/verifiers-0.1.8[${PYTHON_SINGLE_USEDEP}]
	>=dev-python/tilelang-0.1.8[${PYTHON_SINGLE_USEDEP}]
	$(python_gen_cond_dep '
		>=dev-python/beartype-0.21.0[${PYTHON_USEDEP}]
		>=dev-python/jaxtyping-0.3.2[${PYTHON_USEDEP}]
		>=dev-python/loguru-0.7.3[${PYTHON_USEDEP}]
		>=dev-python/pyarrow-21.0.0[${PYTHON_USEDEP}]
		>=dev-python/pydantic-1.10.13[${PYTHON_USEDEP}]
		>=dev-python/pydantic-settings-2.10.1[${PYTHON_USEDEP}]
		>=dev-python/tomli-2.2.1[${PYTHON_USEDEP}]
		>=dev-python/tomli-w-1.2.0[${PYTHON_USEDEP}]
		>=dev-python/numpy-2.2.6[${PYTHON_USEDEP}]
		>=dev-python/wandb-0.20.1[${PYTHON_USEDEP}]
		>=sci-ml/ring-flash-attn-0.1.8[${PYTHON_USEDEP}]
		>=dev-python/pyzmq-27.1.0[${PYTHON_USEDEP}]
		>=dev-python/aiolimiter-1.2.1[${PYTHON_USEDEP}]
		>=dev-python/tenacity-8.2.0[${PYTHON_USEDEP}]
		>=dev-python/openai-1.106.1[${PYTHON_USEDEP}]
		>=dev-python/rich-14.0.0[${PYTHON_USEDEP}]
		>=dev-python/uvloop-0.21.0[${PYTHON_USEDEP}]
	')
"
#BDEPEND="
#	test? (
#	)
#"

distutils_enable_tests pytest

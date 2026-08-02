# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{13..15} )

inherit distutils-r1

DESCRIPTION="Framework for training LLMs with reinforcement fine-tuning"
HOMEPAGE="https://github.com/agentscope-ai/Trinity-RFT"
SRC_URI="https://github.com/agentscope-ai/Trinity-RFT/archive/refs/tags/v${PV}.tar.gz -> ${P}.gh.tar.gz"

S="${WORKDIR}/Trinity-RFT-${PV}"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"
IUSE="agent data flash-attn megatron mm openjudge sglang vllm"
RESTRICT="test"

RDEPEND="
	>=dev-python/aiosqlite-0.17.0[${PYTHON_USEDEP}]
	>=dev-python/fire-0.4.0[${PYTHON_USEDEP}]
	>=dev-python/flask-2.0[${PYTHON_USEDEP}]
	>=dev-python/fsspec-2023.10.0[${PYTHON_USEDEP}]
	>=dev-python/jsonlines-3.0[${PYTHON_USEDEP}]
	>=dev-python/latex2sympy2-extended-0.0[${PYTHON_USEDEP}]
	>=dev-python/math-verify-0.8.0[${PYTHON_USEDEP}]
	>=dev-python/matplotlib-3.0[${PYTHON_USEDEP}]
	>=dev-python/networkx-2.6[${PYTHON_USEDEP}]
	dev-python/ninja[${PYTHON_USEDEP}]
	>=dev-python/nvidia-ml-py-0.0[${PYTHON_USEDEP}]
	>=dev-python/omegaconf-2.1.0[${PYTHON_USEDEP}]
	>=dev-python/openai-1.0.0[${PYTHON_USEDEP}]
	>=dev-python/psutil-5.0.0[${PYTHON_USEDEP}]
	>=dev-python/psycopg2-2.9.0[${PYTHON_USEDEP}]
	>=dev-python/pybase64-1.0.0[${PYTHON_USEDEP}]
	>=dev-python/ray-2.50.0[${PYTHON_USEDEP}]
	>=dev-python/requests-2.28.0[${PYTHON_USEDEP}]
	>=dev-python/sortedcontainers-2.4.0[${PYTHON_USEDEP}]
	>=dev-python/sqlalchemy-1.4.0[${PYTHON_USEDEP}]
	>=dev-python/streamlit-1.0.0[${PYTHON_USEDEP}]
	>=dev-python/typer-0.23.0[${PYTHON_USEDEP}]
	>=dev-python/wandb-0.12.0[${PYTHON_USEDEP}]
	>=dev-python/word2number-1.1[${PYTHON_USEDEP}]
	sci-ml/datasets[${PYTHON_USEDEP}]
	sci-ml/tensorboard
	sci-ml/transformers
	>=sci-ml/tensordict-0.0[${PYTHON_USEDEP}]
	>=sci-ml/verl-0.7.1[${PYTHON_USEDEP}]
	agent? ( >=sci-ml/agentscope-1.0.19 )
	data? ( >=dev-python/py-data-juicer-1.4.3[${PYTHON_USEDEP}] )
	flash-attn? ( >=sci-ml/flash-attn-2.8.3 )
	megatron? ( >=sci-ml/megatron-core-0.16.1 )
	mm? (
		>=dev-python/blobfile-2.0[${PYTHON_USEDEP}]
		>=sci-ml/qwen-vl-utils-0.0[${PYTHON_USEDEP}]
	)
	openjudge? ( >=dev-python/py-openjudge-0.2.2[${PYTHON_USEDEP}] )
	sglang? ( >=sci-ml/sglang-0.5.13[${PYTHON_USEDEP}] )
	vllm? ( >=sci-ml/vllm-0.19.1 )
"

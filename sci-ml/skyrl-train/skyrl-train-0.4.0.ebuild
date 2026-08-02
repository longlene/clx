# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_SINGLE_IMPL=1
DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{13..15} )

inherit distutils-r1

DESCRIPTION="Modular full-stack reinforcement learning library for LLMs"
HOMEPAGE="https://github.com/NovaSky-AI/SkyRL"
SRC_URI="https://github.com/NovaSky-AI/SkyRL/archive/refs/tags/skyrl_train-v${PV}.tar.gz -> ${P}.gh.tar.gz"

S="${WORKDIR}/SkyRL-skyrl_train-v${PV}/skyrl-train"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	sci-ml/accelerate[${PYTHON_SINGLE_USEDEP}]
	sci-ml/flash-attn[${PYTHON_SINGLE_USEDEP}]
	sci-ml/peft[${PYTHON_SINGLE_USEDEP}]
	sci-ml/tensorboard[${PYTHON_SINGLE_USEDEP}]
	sci-ml/tensordict[${PYTHON_SINGLE_USEDEP}]
	sci-ml/torchdata[${PYTHON_SINGLE_USEDEP}]
	>=sci-ml/transformers-4.51.0[${PYTHON_SINGLE_USEDEP}]
	>=sci-ml/datasets-4.0.0[${PYTHON_SINGLE_USEDEP}]
	$(python_gen_cond_dep '
		>=dev-python/debugpy-1.8.0[${PYTHON_USEDEP}]
		dev-python/fastapi[${PYTHON_USEDEP}]
		dev-python/func-timeout[${PYTHON_USEDEP}]
		dev-python/hf-transfer[${PYTHON_USEDEP}]
		>=dev-python/hydra-core-1.3.2[${PYTHON_USEDEP}]
		dev-python/jaxtyping[${PYTHON_USEDEP}]
		dev-python/loguru[${PYTHON_USEDEP}]
		dev-python/ninja[${PYTHON_USEDEP}]
		dev-python/omegaconf[${PYTHON_USEDEP}]
		dev-python/polars[${PYTHON_USEDEP}]
		dev-python/pybind11[${PYTHON_USEDEP}]
		dev-python/ray[${PYTHON_USEDEP}]
		dev-python/s3fs[${PYTHON_USEDEP}]
		dev-python/tqdm[${PYTHON_USEDEP}]
		dev-python/uvicorn[${PYTHON_USEDEP}]
		dev-python/wandb[${PYTHON_USEDEP}]
		sci-ml/skyrl-gym[${PYTHON_USEDEP}]
	')
"
BDEPEND=""
RESTRICT="test"

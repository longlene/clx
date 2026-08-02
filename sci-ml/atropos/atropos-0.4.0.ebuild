# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=hatchling
PYTHON_COMPAT=( python3_{13..15} )

inherit distutils-r1

DESCRIPTION="LLM Reinforcement Learning Environments framework for collecting trajectories"
HOMEPAGE="https://github.com/NousResearch/atropos"
SRC_URI="https://github.com/NousResearch/atropos/archive/refs/tags/v${PV}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE="trainer"

RDEPEND="
	sci-ml/transformers[${PYTHON_USEDEP}]
	sci-ml/datasets[${PYTHON_USEDEP}]
	>=dev-python/openai-1.0.0[${PYTHON_USEDEP}]
	dev-python/aiohttp[${PYTHON_USEDEP}]
	dev-python/tqdm[${PYTHON_USEDEP}]
	dev-python/fastapi[${PYTHON_USEDEP}]
	dev-python/uvicorn[${PYTHON_USEDEP}]
	dev-python/tenacity[${PYTHON_USEDEP}]
	dev-python/markdown[${PYTHON_USEDEP}]
	dev-python/numpy[${PYTHON_USEDEP}]
	dev-python/wandb[${PYTHON_USEDEP}]
	sci-ml/gymnasium[${PYTHON_USEDEP}]
	>=dev-python/math-verify-0.8.0[${PYTHON_USEDEP}]
	dev-python/jinja2[${PYTHON_USEDEP}]
	dev-python/nltk[${PYTHON_USEDEP}]
	dev-python/rich[${PYTHON_USEDEP}]
	dev-python/polars[${PYTHON_USEDEP}]
	dev-python/aiofiles[${PYTHON_USEDEP}]
	dev-python/jsonlines[${PYTHON_USEDEP}]
	dev-python/pydantic-cli[${PYTHON_USEDEP}]
	dev-python/hf-transfer[${PYTHON_USEDEP}]
	trainer? (
		>=sci-ml/pytorch-2.5[${PYTHON_USEDEP}]
		sci-ml/accelerate[${PYTHON_USEDEP}]
		sci-ml/peft[${PYTHON_USEDEP}]
	)
"

EPYTEST_PLUGINS=()
distutils_enable_tests pytest

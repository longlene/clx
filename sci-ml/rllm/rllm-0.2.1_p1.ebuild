# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

MY_PV="${PV/_p/.post}"

DISTUTILS_SINGLE_IMPL=1
DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{13..15} )

inherit distutils-r1

DESCRIPTION="Reinforcement Learning for Language Agents"
HOMEPAGE="https://github.com/rllm-org/rllm https://docs.rllm-project.com"
SRC_URI="https://github.com/rllm-org/rllm/archive/refs/tags/v${MY_PV}.tar.gz -> ${P}.gh.tar.gz"
S="${WORKDIR}/${PN}-${MY_PV}"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"
RESTRICT="test"

RDEPEND="
	sci-ml/pytorch[${PYTHON_SINGLE_USEDEP}]
	sci-ml/torchvision[${PYTHON_SINGLE_USEDEP}]
	>=sci-ml/transformers-4.55.0[${PYTHON_SINGLE_USEDEP}]
	>=sci-ml/datasets-2.20.0[${PYTHON_SINGLE_USEDEP}]
	$(python_gen_cond_dep '
		dev-python/ray[${PYTHON_USEDEP}]
		dev-python/pandas[${PYTHON_USEDEP}]
		dev-python/polars[${PYTHON_USEDEP}]
		dev-python/pillow[${PYTHON_USEDEP}]
		dev-python/numpy[${PYTHON_USEDEP}]
		dev-python/sympy[${PYTHON_USEDEP}]
		dev-python/pylatexenc[${PYTHON_USEDEP}]
		dev-python/antlr4-python3-runtime[${PYTHON_USEDEP}]
		dev-python/mcp[${PYTHON_USEDEP}]
		dev-python/eval-protocol[${PYTHON_USEDEP}]
		dev-python/hydra-core[${PYTHON_USEDEP}]
		dev-python/openai[${PYTHON_USEDEP}]
		dev-python/fastapi[${PYTHON_USEDEP}]
		dev-python/uvicorn[${PYTHON_USEDEP}]
		dev-python/tqdm[${PYTHON_USEDEP}]
		dev-python/pyyaml[${PYTHON_USEDEP}]
		dev-python/pydantic[${PYTHON_USEDEP}]
		dev-python/wrapt[${PYTHON_USEDEP}]
		>=dev-python/asgiref-3.7.0[${PYTHON_USEDEP}]
		dev-python/wandb[${PYTHON_USEDEP}]
	')
"

export SETUPTOOLS_SCM_PRETEND_VERSION_FOR_RLLM="${PV%_*}"

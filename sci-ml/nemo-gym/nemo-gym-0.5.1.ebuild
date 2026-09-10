# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_SINGLE_IMPL=1
DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{13..15} )

inherit distutils-r1

DESCRIPTION="Build RL environments for LLM training"
HOMEPAGE="
	https://github.com/NVIDIA-NeMo/Gym
	https://docs.nvidia.com/nemo/gym/latest/index.html
"
SRC_URI="https://github.com/NVIDIA-NeMo/Gym/archive/refs/tags/v${PV}.tar.gz -> ${P}.gh.tar.gz"
S="${WORKDIR}"/Gym-${PV}

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	sci-ml/datasets[${PYTHON_SINGLE_USEDEP}]
	$(python_gen_cond_dep '
		dev-python/openai[${PYTHON_USEDEP}]
		dev-python/anthropic[${PYTHON_USEDEP}]
		dev-python/tqdm[${PYTHON_USEDEP}]
		dev-python/pydantic[${PYTHON_USEDEP}]
		dev-python/pydantic-core[${PYTHON_USEDEP}]
		dev-python/devtools[${PYTHON_USEDEP}]
		dev-python/fastapi[${PYTHON_USEDEP}]
		>=dev-python/mcp-1.28.1[${PYTHON_USEDEP}]
		dev-python/itsdangerous[${PYTHON_USEDEP}]
		dev-python/uvicorn[${PYTHON_USEDEP}]
		dev-python/uvloop[${PYTHON_USEDEP}]
		dev-python/hydra-core[${PYTHON_USEDEP}]
		dev-python/omegaconf[${PYTHON_USEDEP}]
		dev-python/rich[${PYTHON_USEDEP}]
		>=dev-python/mlflow-skinny-3.15.1[${PYTHON_USEDEP}]
		>=dev-python/mlflow-3.15.1[${PYTHON_USEDEP}]
		>=dev-python/aiohttp-3.14.1[${PYTHON_USEDEP}]
		dev-python/yappi[${PYTHON_USEDEP}]
		>=dev-python/ray-2.56.1[${PYTHON_USEDEP}]
		dev-python/psutil[${PYTHON_USEDEP}]
		>=dev-python/orjson-3.11.6[${PYTHON_USEDEP}]
		>=dev-python/msgpack-1.2.1[${PYTHON_USEDEP}]
		>=dev-python/urllib3-2.7.0[${PYTHON_USEDEP}]
		>=dev-python/fonttools-4.60.2[${PYTHON_USEDEP}]
		>=dev-python/python-multipart-0.0.30[${PYTHON_USEDEP}]
		>=dev-python/pyarrow-23.0.1[${PYTHON_USEDEP}]
		>=dev-python/wandb-0.27.0[${PYTHON_USEDEP}]
		>=dev-python/gitpython-3.1.57[${PYTHON_USEDEP}]
		>=dev-python/pyasn1-0.6.4[${PYTHON_USEDEP}]
		dev-python/pydot[${PYTHON_USEDEP}]
	')
"
BDEPEND="$(python_gen_cond_dep 'dev-python/setuptools-scm[${PYTHON_USEDEP}]')"

distutils_enable_tests pytest

src_prepare() {
	export SETUPTOOLS_SCM_PRETEND_VERSION=${PV}
	distutils-r1_src_prepare
}

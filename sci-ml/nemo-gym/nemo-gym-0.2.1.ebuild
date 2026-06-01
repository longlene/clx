# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_SINGLE_IMPL=1
DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{11..14} )

inherit distutils-r1

DESCRIPTION="Build RL environments for LLM training"
HOMEPAGE="
	https://github.com/NVIDIA-NeMo/Gym
	https://docs.nvidia.com/nemo/gym/latest/index.html
"
SRC_URI="https://github.com/NVIDIA-NeMo/Gym/archive/refs/tags/v${PV}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
S="${WORKDIR}"/Gym-${PV}
KEYWORDS="~amd64"

RDEPEND="
	sci-ml/datasets[${PYTHON_SINGLE_USEDEP}]
	$(python_gen_cond_dep '
		dev-python/openai[${PYTHON_USEDEP}]
		dev-python/tqdm[${PYTHON_USEDEP}]
		dev-python/pydantic[${PYTHON_USEDEP}]
		dev-python/pydantic-core[${PYTHON_USEDEP}]
		dev-python/devtools[${PYTHON_USEDEP}]
		dev-python/fastapi[${PYTHON_USEDEP}]
		dev-python/itsdangerous[${PYTHON_USEDEP}]
		dev-python/uvicorn[${PYTHON_USEDEP}]
		dev-python/uvloop[${PYTHON_USEDEP}]
		dev-python/hydra[${PYTHON_USEDEP}]
		dev-python/omegaconf[${PYTHON_USEDEP}]
		dev-python/rich[${PYTHON_USEDEP}]
		dev-python/mlflow-skinny[${PYTHON_USEDEP}]
		dev-python/mlflow[${PYTHON_USEDEP}]
		>=dev-python/aiohttp-3.13.3[${PYTHON_USEDEP}]
		dev-python/yappi[${PYTHON_USEDEP}]
		dev-python/ray[${PYTHON_USEDEP}]
		dev-python/psutil[${PYTHON_USEDEP}]
		dev-python/orjson[${PYTHON_USEDEP}]
		>=dev-python/urllib3-2.6.3[${PYTHON_USEDEP}]
		>=dev-python/fonttools-4.60.2[${PYTHON_USEDEP}]
		>=dev-python/python-multipart-0.0.22[${PYTHON_USEDEP}]
		dev-python/wandb[${PYTHON_USEDEP}]
		dev-util/gprof2dot[${PYTHON_USEDEP}]
		dev-python/pydot[${PYTHON_USEDEP}]
	')
"
#BDEPEND="
#	test? (
#	)
#"

distutils_enable_tests pytest

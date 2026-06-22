# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_SINGLE_IMPL=1
DISTUTILS_USE_PEP517=hatchling
PYTHON_COMPAT=( python3_{13..14} )

inherit distutils-r1

DESCRIPTION="Scalable, reproducible evaluation of AI models and benchmarks"
HOMEPAGE="https://github.com/NVIDIA-NeMo/Evaluator https://docs.nvidia.com/nemo/evaluator/latest/"
SRC_URI="https://github.com/NVIDIA-NeMo/Evaluator/archive/refs/tags/v${PV}.tar.gz
	-> ${P}.gh.tar.gz"
S="${WORKDIR}/Evaluator-${PV}"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"
IUSE="scoring stats"
RESTRICT="test"

RDEPEND="
	sci-ml/datasets[${PYTHON_SINGLE_USEDEP}]
	$(python_gen_cond_dep '
		>=dev-python/pydantic-2.0[${PYTHON_USEDEP}]
		>=dev-python/fastapi-0.100[${PYTHON_USEDEP}]
		>=dev-python/uvicorn-0.20[${PYTHON_USEDEP}]
		>=dev-python/aiohttp-3.9[${PYTHON_USEDEP}]
		>=dev-python/pyyaml-6.0[${PYTHON_USEDEP}]
		>=dev-python/click-8.0[${PYTHON_USEDEP}]
		>=dev-python/numpy-1.24[${PYTHON_USEDEP}]
		>=dev-python/jinja2-3.0[${PYTHON_USEDEP}]
		>=dev-python/starlette-0.27[${PYTHON_USEDEP}]
		>=dev-python/boto3-1.28[${PYTHON_USEDEP}]
		scoring? ( >=dev-python/sympy-1.12[${PYTHON_USEDEP}] )
		stats? ( >=dev-python/scipy-1.10[${PYTHON_USEDEP}] )
	')
"
DEPEND="${RDEPEND}"

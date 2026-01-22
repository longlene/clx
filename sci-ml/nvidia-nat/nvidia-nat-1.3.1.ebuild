# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_SINGLE_IMPL=1
DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{11..14} )

inherit distutils-r1

DESCRIPTION="NVIDIA NeMo Agent Toolkit"
HOMEPAGE="
	https://github.com/NVIDIA/NeMo-Agent-Toolkit
	https://docs.nvidia.com/nemo/agent-toolkit/latest/
"
SRC_URI="https://github.com/NVIDIA/NeMo-Agent-Toolkit/archive/refs/tags/v${PV}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}
	>=sci-ml/datasets-4.4[${PYTHON_SINGLE_USEDEP}]
	>=dev-python/ragas-0.2.14[${PYTHON_SINGLE_USEDEP}]
	$(python_gen_cond_dep '
		>=dev-python/aioboto3-11.0.0[${PYTHON_USEDEP}]
		>=dev-python/authlib-1.6.5[${PYTHON_USEDEP}]
		>=dev-python/click-8.1[${PYTHON_USEDEP}]
		>=dev-python/colorama-0.4.6[${PYTHON_USEDEP}]
		>=dev-python/expandvars-1.0[${PYTHON_USEDEP}]
		>=dev-python/fastapi-0.119.0[${PYTHON_USEDEP}]
		>=dev-python/httpx-0.27[${PYTHON_USEDEP}]
		>=dev-python/jinja2-3.1[${PYTHON_USEDEP}]
		>=dev-python/jsonpath-ng-1.7[${PYTHON_USEDEP}]
		>=dev-python/nest-asyncio2-1.7.1[${PYTHON_USEDEP}]
		>=dev-python/networkx-3.4[${PYTHON_USEDEP}]
		>=dev-python/numpy-2.3[${PYTHON_USEDEP}]
		>=dev-python/openinference-semantic-conventions-0.1.14[${PYTHON_USEDEP}]
		>=dev-python/openpyxl-3.1[${PYTHON_USEDEP}]
		>=dev-python/optuna-4.4.0[${PYTHON_USEDEP}]
		>=dev-python/pandas-2.2[${PYTHON_USEDEP}]
		>=dev-python/pip-24.3.1[${PYTHON_USEDEP}]
		>=dev-python/pkce-1.0.3[${PYTHON_USEDEP}]
		>=dev-python/pkginfo-1.12[${PYTHON_USEDEP}]
		>=dev-python/platformdirs-4.3[${PYTHON_USEDEP}]
		>=dev-python/plotly-6.0[${PYTHON_USEDEP}]
		>=dev-python/pydantic-2.11[${PYTHON_USEDEP}]
		>=dev-python/pymilvus-2.6[${PYTHON_USEDEP}]
		>=dev-python/python-dotenv-1.1.1[${PYTHON_USEDEP}]
		>=dev-python/pyyaml-6.0[${PYTHON_USEDEP}]
		>=dev-python/rich-14.0.0[${PYTHON_USEDEP}]
		>=dev-python/tabulate-0.9[${PYTHON_USEDEP}]
		>=dev-python/uvicorn-0.38[${PYTHON_USEDEP}]
		>=dev-python/wikipedia-1.4.0[${PYTHON_USEDEP}]
		>=dev-python/urllib3-2.6.3[${PYTHON_USEDEP}]
	')

"
#BDEPEND="
#	test? (
#	)
#"

distutils_enable_tests pytest

S="${WORKDIR}"/NeMo-Agent-Toolkit-${PV}

export SETUPTOOLS_SCM_PRETEND_VERSION_FOR_NVIDIA_NAT="${PV}"

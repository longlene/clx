# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_SINGLE_IMPL=1
DISTUTILS_USE_PEP517=hatchling
PYTHON_COMPAT=( python3_{13..15} )

inherit distutils-r1

MY_PV="0.1.3-rc0"

DESCRIPTION="File management service for the NeMo Platform"
HOMEPAGE="https://github.com/NVIDIA-NeMo/nemo-platform"
SRC_URI="https://github.com/NVIDIA-NeMo/nemo-platform/archive/refs/tags/${MY_PV}.tar.gz -> nemo-platform-0.1.3_rc0.gh.tar.gz"

S="${WORKDIR}/nemo-platform-${MY_PV}/services/core/files"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	$(python_gen_cond_dep '
		>=dev-python/aiohttp-3.13.4[${PYTHON_USEDEP}]
		>=dev-python/aioboto3-15.5.0[${PYTHON_USEDEP}]
		>=dev-python/anyio-4.0.0[${PYTHON_USEDEP}]
		>=dev-python/duckdb-1.1.3[${PYTHON_USEDEP}]
		>=dev-python/fastapi-0.115.8[${PYTHON_USEDEP}]
		>=dev-python/ngcsdk-4.9.10[${PYTHON_USEDEP}]
		>=dev-python/opentelemetry-proto-1.28.2[${PYTHON_USEDEP}]
		>=dev-python/pandas-1.5.3[${PYTHON_USEDEP}]
		>=dev-python/pydantic-2.10.6[${PYTHON_USEDEP}]
		>=dev-python/pydantic-settings-2.8.1[${PYTHON_USEDEP}]
		>=dev-python/pyyaml-6.0.2[${PYTHON_USEDEP}]
		>=dev-python/streaming-form-data-1.19.1[${PYTHON_USEDEP}]
		>=dev-python/types-aioboto3-15.5.0[${PYTHON_USEDEP}]
		>=dev-python/uvicorn-0.34.0[${PYTHON_USEDEP}]
		sci-ml/filesets[${PYTHON_USEDEP}]
	')
	sci-ml/nmp-common[${PYTHON_SINGLE_USEDEP}]
"
BDEPEND=""
RESTRICT="test"

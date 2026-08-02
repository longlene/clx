# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=hatchling
PYTHON_COMPAT=( python3_{13..15} )

inherit distutils-r1

DESCRIPTION="Platform for running AI agents on realtime sport data for game predictions"
HOMEPAGE="https://github.com/agentscope-ai/DojoZero"
SRC_URI="https://github.com/agentscope-ai/DojoZero/archive/refs/tags/v${PV}.tar.gz -> ${P}.gh.tar.gz"

S="${WORKDIR}/DojoZero-${PV}/packages/dojozero"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE="alicloud ray redis"
RESTRICT="test"

RDEPEND="
	>=dev-python/aiohttp-3.9.0[${PYTHON_USEDEP}]
	>=sci-ml/agentscope-1.0.14[${PYTHON_USEDEP}]
	>=dev-python/dashscope-1.0.0[${PYTHON_USEDEP}]
	>=dev-python/fastapi-0.128.0[${PYTHON_USEDEP}]
	>=dev-python/httpx-0.28.0[${PYTHON_USEDEP}]
	>=dev-python/matplotlib-3.10.8[${PYTHON_USEDEP}]
	>=dev-python/opentelemetry-api-1.29.0[${PYTHON_USEDEP}]
	>=dev-python/opentelemetry-exporter-otlp-proto-http-1.29.0[${PYTHON_USEDEP}]
	>=dev-python/opentelemetry-sdk-1.29.0[${PYTHON_USEDEP}]
	>=dev-python/py-clob-client-0.1.0[${PYTHON_USEDEP}]
	>=dev-python/pydantic-2.12.4[${PYTHON_USEDEP}]
	>=dev-python/python-dotenv-1.2.1[${PYTHON_USEDEP}]
	>=dev-python/pyyaml-6.0[${PYTHON_USEDEP}]
	>=dev-python/tavily-python-0.7.12[${PYTHON_USEDEP}]
	>=dev-python/uvicorn-0.40.0[${PYTHON_USEDEP}]
	>=dev-python/xdk-0.9.0[${PYTHON_USEDEP}]
	alicloud? (
		>=dev-python/alibabacloud-credentials-1.0.0[${PYTHON_USEDEP}]
		>=dev-python/aliyun-log-python-sdk-0.0[${PYTHON_USEDEP}]
		>=dev-python/oss2-2.18.0[${PYTHON_USEDEP}]
	)
	ray? ( >=dev-python/ray-2.51.1[${PYTHON_USEDEP}] )
	redis? ( >=dev-python/redis-7.2.1[${PYTHON_USEDEP}] )
"

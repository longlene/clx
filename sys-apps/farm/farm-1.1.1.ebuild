# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=poetry
PYTHON_COMPAT=( python3_{13..15} )

inherit distutils-r1

DESCRIPTION="Job scheduler for cloud based workloads"
HOMEPAGE="https://github.com/NVIDIA/farm"
SRC_URI="https://github.com/NVIDIA/farm/archive/refs/tags/${PV}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"
RESTRICT="test"

RDEPEND="$(python_gen_cond_dep '
	>=dev-python/aiohttp-3.10.0[${PYTHON_USEDEP}]
	>=dev-python/aiodocker-0.22.2[${PYTHON_USEDEP}]
	>=dev-python/aiosqlite-0.20.0[${PYTHON_USEDEP}]
	>=dev-python/asgi-correlation-id-4.3.1[${PYTHON_USEDEP}]
	>=dev-python/databases-0.9.0[${PYTHON_USEDEP}]
	>=dev-python/dynaconf-3.2.6[${PYTHON_USEDEP}]
	>=dev-python/elasticsearch-8.17.2[${PYTHON_USEDEP}]
	>=dev-python/fastapi-0.115.0[${PYTHON_USEDEP}]
	>=dev-python/grpc-interceptor-0.15.4[${PYTHON_USEDEP}]
	>=dev-python/grpcio-1.66.0[${PYTHON_USEDEP}]
	>=dev-python/kubernetes-asyncio-29.0.0[${PYTHON_USEDEP}]
	>=dev-python/networkx-3.4.2[${PYTHON_USEDEP}]
	>=dev-python/opentelemetry-api-1.25.0[${PYTHON_USEDEP}]
	>=dev-python/opentelemetry-exporter-otlp-proto-grpc-1.25.0[${PYTHON_USEDEP}]
	>=dev-python/opentelemetry-sdk-1.25.0[${PYTHON_USEDEP}]
	>=dev-python/opensearch-py-2.7.1[${PYTHON_USEDEP}]
	>=dev-python/aiomysql-0.2.0[${PYTHON_USEDEP}]
	>=dev-python/platformdirs-4.3.6[${PYTHON_USEDEP}]
	>=dev-python/prometheus-client-0.21.0[${PYTHON_USEDEP}]
	>=dev-python/psutil-6.0.0[${PYTHON_USEDEP}]
	>=dev-python/pynvml-11.5.3[${PYTHON_USEDEP}]
	>=dev-python/redis-5.0.8[${PYTHON_USEDEP}]
	>=dev-python/starlette-0.40.0[${PYTHON_USEDEP}]
	>=dev-python/tabulate-0.9.0[${PYTHON_USEDEP}]
	>=dev-python/toml-0.10.2[${PYTHON_USEDEP}]
	>=dev-python/uvicorn-0.30.0[${PYTHON_USEDEP}]
	>=dev-python/uvloop-0.20.0[${PYTHON_USEDEP}]
	>=dev-python/watchdog-4.0.2[${PYTHON_USEDEP}]
')"

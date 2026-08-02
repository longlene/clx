# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_SINGLE_IMPL=1
DISTUTILS_USE_PEP517=hatchling
PYTHON_COMPAT=( python3_{13..15} )

inherit distutils-r1

MY_PV="0.1.3-rc0"

DESCRIPTION="Common library for NeMo Platform services"
HOMEPAGE="https://github.com/NVIDIA-NeMo/nemo-platform"
SRC_URI="https://github.com/NVIDIA-NeMo/nemo-platform/archive/refs/tags/${MY_PV}.tar.gz -> nemo-platform-0.1.3_rc0.gh.tar.gz"

S="${WORKDIR}/nemo-platform-${MY_PV}/packages/nmp_common"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	sci-ml/huggingface_hub[${PYTHON_SINGLE_USEDEP}]
	$(python_gen_cond_dep '
		>=dev-python/aiofiles-24.1.0[${PYTHON_USEDEP}]
		>=dev-python/base58-2.1.1[${PYTHON_USEDEP}]
		>=dev-python/fastapi-0.115.4[${PYTHON_USEDEP}]
		>=dev-python/hvac-2.3.0[${PYTHON_USEDEP}]
		>=dev-python/httpx-0.27.0[${PYTHON_USEDEP}]
		>=dev-python/kubernetes-30.1.0[${PYTHON_USEDEP}]
		>=dev-python/lark-1.1.0[${PYTHON_USEDEP}]
		>=dev-python/nvidia-ml-py-13.0.0[${PYTHON_USEDEP}]
		>=dev-python/opentelemetry-exporter-otlp-proto-grpc-1.38.0[${PYTHON_USEDEP}]
		>=dev-python/opentelemetry-exporter-otlp-proto-http-1.38.0[${PYTHON_USEDEP}]
		>=dev-python/opentelemetry-exporter-prometheus-0.59_beta0[${PYTHON_USEDEP}]
		>=dev-python/opentelemetry-instrumentation-fastapi-0.59_beta0[${PYTHON_USEDEP}]
		>=dev-python/opentelemetry-instrumentation-httpx-0.59_beta0[${PYTHON_USEDEP}]
		>=dev-python/opentelemetry-instrumentation-sqlalchemy-0.59_beta0[${PYTHON_USEDEP}]
		>=dev-python/opentelemetry-instrumentation-system-metrics-0.59_beta0[${PYTHON_USEDEP}]
		>=dev-python/opentelemetry-processor-baggage-0.59_beta0[${PYTHON_USEDEP}]
		>=dev-python/opentelemetry-sdk-1.38.0[${PYTHON_USEDEP}]
		>=dev-python/prometheus-client-0.23.0[${PYTHON_USEDEP}]
		>=dev-python/prometheus-fastapi-instrumentator-7.1.0[${PYTHON_USEDEP}]
		>=dev-python/pydantic-2.10.3[${PYTHON_USEDEP}]
		>=dev-python/pydantic-settings-2.8.1[${PYTHON_USEDEP}]
		>=dev-python/pyjwt-2.12.0[${PYTHON_USEDEP}]
		>=dev-python/pyyaml-6.0.2[${PYTHON_USEDEP}]
		>=dev-python/sqlalchemy-2.0.0[${PYTHON_USEDEP}]
		>=dev-python/structlog-24.1.0[${PYTHON_USEDEP}]
		sci-ml/nemo-platform-plugin[${PYTHON_USEDEP}]
		sci-ml/nemo-platform-sdk[${PYTHON_USEDEP}]
	')
"
BDEPEND=""
RESTRICT="test"

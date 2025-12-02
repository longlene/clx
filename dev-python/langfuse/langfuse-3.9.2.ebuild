# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=poetry
PYTHON_COMPAT=( python3_{13..14} )

inherit distutils-r1

DESCRIPTION="Langfuse Python SDK"
HOMEPAGE="
	https://pypi.org/project/langfuse/
	https://github.com/langfuse/langfuse-python
"
SRC_URI="https://github.com/langfuse/langfuse-python/archive/refs/tags/v${PV}.tar.gz -> langfuse-python-${PV}.gh.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	>=dev-python/httpx-0.15.4[${PYTHON_USEDEP}]
	>=dev-python/pydantic-1.10.7[${PYTHON_USEDEP}]
	>=dev-python/backoff-1.10.0[${PYTHON_USEDEP}]
	>=dev-python/wrapt-1.14[${PYTHON_USEDEP}]
	>=dev-python/packaging-23.2[${PYTHON_USEDEP}]
	dev-python/requests[${PYTHON_USEDEP}]
	>=dev-python/opentelemetry-api-1.33.1[${PYTHON_USEDEP}]
	>=dev-python/opentelemetry-sdk-1.33.1[${PYTHON_USEDEP}]
	>=dev-python/opentelemetry-exporter-otlp-proto-http-1.33.1[${PYTHON_USEDEP}]
"
#BDEPEND="
#	test? (
#	)
#"

EPYTEST_PLUGINS=()
distutils_enable_tests pytest

S="${WORKDIR}"/${PN}-python-${PV}

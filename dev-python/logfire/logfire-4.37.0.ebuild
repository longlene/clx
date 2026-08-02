# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=hatchling
PYTHON_COMPAT=( python3_{13..15} )

inherit distutils-r1

DESCRIPTION="Observability platform for Python applications and AI agents"
HOMEPAGE="https://github.com/pydantic/logfire"
SRC_URI="https://github.com/pydantic/logfire/archive/refs/tags/v${PV}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
RESTRICT="test"

RDEPEND="
	>=dev-python/executing-2.0.1[${PYTHON_USEDEP}]
	>=dev-python/opentelemetry-exporter-otlp-proto-http-1.39.0[${PYTHON_USEDEP}]
	>=dev-python/opentelemetry-instrumentation-0.41_beta0[${PYTHON_USEDEP}]
	>=dev-python/opentelemetry-sdk-1.39.0[${PYTHON_USEDEP}]
	dev-python/protobuf[${PYTHON_USEDEP}]
	>=dev-python/rich-13.4.2[${PYTHON_USEDEP}]
	>=dev-python/typing-extensions-4.1.0[${PYTHON_USEDEP}]
"

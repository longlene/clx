# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=hatchling
PYTHON_COMPAT=( python3_{13..14} )

inherit distutils-r1

DESCRIPTION="Official Python SDK for the Agent2Agent (A2A) Protocol"
HOMEPAGE="
	https://pypi.org/project/a2a-python/
	https://github.com/a2aproject/a2a-python
"
SRC_URI="https://github.com/a2aproject/a2a-python/archive/refs/tags/v${PV}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	>=dev-python/httpx-0.28.1[${PYTHON_USEDEP}]
	>=dev-python/httpx-sse-0.4.0[${PYTHON_USEDEP}]
	>=dev-python/pydantic-2.11.3[${PYTHON_USEDEP}]
	>=dev-python/protobuf-5.29.5[${PYTHON_USEDEP}]
	>=dev-python/google-api-core-1.26.0[${PYTHON_USEDEP}]
"
BDEPEND="
	dev-python/uv-dynamic-versioning[${PYTHON_USEDEP}]
"
#BDEPEND="
#	test? (
#	)
#"

EPYTEST_PLUGINS=()
distutils_enable_tests pytest

export UV_DYNAMIC_VERSIONING_BYPASS="${PV}"

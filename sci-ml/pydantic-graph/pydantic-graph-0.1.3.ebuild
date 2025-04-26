# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=hatchling
PYTHON_COMPAT=( python3_{11..13} )

inherit distutils-r1

MY_P=pydantic-ai-${PV}

DESCRIPTION="Graph and state machine library"
HOMEPAGE="
	https://ai.pydantic.dev/
	https://github.com/pydantic/pydantic-ai
	https://pypi.org/project/pydantic-graph/
"
SRC_URI="https://github.com/pydantic/pydantic-ai/archive/refs/tags/v${PV}.tar.gz -> ${MY_P}.gh.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	>=dev-python/httpx-0.27[${PYTHON_USEDEP}]
	>=dev-python/logfire-api-1.2.0[${PYTHON_USEDEP}]
	>=dev-python/pydantic-2.10[${PYTHON_USEDEP}]
	>=dev-python/typing-inspection-0.4.0[${PYTHON_USEDEP}]
"
BDEPEND="
	dev-python/uv-dynamic-versioning[${PYTHON_USEDEP}]
"
#BDEPEND="
#	test? (
#	)
#"

distutils_enable_tests pytest

S="${WORKDIR}"/${MY_P}/pydantic_graph

export UV_DYNAMIC_VERSIONING_BYPASS="${PV}"

# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=hatchling
PYTHON_COMPAT=( python3_{13..15} )

inherit distutils-r1

MY_P="${PN}-python-${PV}"

DESCRIPTION="OpenAI Agents SDK"
HOMEPAGE="
	https://pypi.org/project/openai-agents/
	https://github.com/openai/openai-agents-python
"
SRC_URI="https://github.com/openai/openai-agents-python/archive/refs/tags/v${PV}.tar.gz -> ${MY_P}.gh.tar.gz"

S="${WORKDIR}/${MY_P}"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	>=dev-python/openai-3.0.0[${PYTHON_USEDEP}]
	>=dev-python/pydantic-2.12.2[${PYTHON_USEDEP}]
	>=dev-python/griffelib-2[${PYTHON_USEDEP}]
	>=dev-python/typing-extensions-4.12.2[${PYTHON_USEDEP}]
	>=dev-python/requests-2.0[${PYTHON_USEDEP}]
	>=dev-python/websockets-15.0[${PYTHON_USEDEP}]
	>=dev-python/mcp-1.19.0[${PYTHON_USEDEP}]
"

EPYTEST_PLUGINS=()
distutils_enable_tests pytest

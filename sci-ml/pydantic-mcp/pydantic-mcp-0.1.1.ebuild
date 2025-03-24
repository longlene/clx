# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=hatchling
PYTHON_COMPAT=( python3_{11..13} )

inherit distutils-r1

DESCRIPTION="Model Context Protocol tool calling support for Pydantic AI"
HOMEPAGE="
	https://pypi.org/project/pydantic-mcp/
	https://github.com/rectalogic/pydantic-mcp
"
SRC_URI="https://github.com/rectalogic/pydantic-mcp/archive/refs/tags/${PV}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	>=dev-python/mcp-1.0[${PYTHON_USEDEP}]
	>=dev-python/pydantic-2.10[${PYTHON_USEDEP}]
	>=dev-python/pydantic-ai-0.0.35[${PYTHON_USEDEP}]
	>=dev-python/typing-extensions-4.12[${PYTHON_USEDEP}]
"
#BDEPEND="
#	test? (
#	)
#"

distutils_enable_tests pytest

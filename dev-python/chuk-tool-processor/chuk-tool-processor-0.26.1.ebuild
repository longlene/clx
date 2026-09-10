# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{13..15} )

inherit distutils-r1 pypi

DESCRIPTION="Async framework for registering, discovering, and executing tools"
HOMEPAGE="https://pypi.org/project/chuk-tool-processor/"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	>=dev-python/chuk-mcp-0.9[${PYTHON_USEDEP}]
	<dev-python/chuk-mcp-0.10[${PYTHON_USEDEP}]
	>=dev-python/python-dotenv-1.0.0[${PYTHON_USEDEP}]
	>=dev-python/psutil-7.0.0[${PYTHON_USEDEP}]
	>=dev-python/pydantic-2.11.3[${PYTHON_USEDEP}]
"

distutils_enable_tests pytest

# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=hatchling
PYTHON_COMPAT=( python3_{13..15} )

inherit distutils-r1 pypi

DESCRIPTION="Reusable OAuth 2.0 client library for MCP servers"
HOMEPAGE="https://pypi.org/project/chuk-mcp-client-oauth/"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	>=dev-python/httpx-0.24.0[${PYTHON_USEDEP}]
	>=dev-python/pydantic-2.0.0[${PYTHON_USEDEP}]
	>=dev-python/cryptography-41.0.0[${PYTHON_USEDEP}]
	>=dev-python/secretstorage-3.3.0[${PYTHON_USEDEP}]
	>=dev-python/keyring-24.0.0[${PYTHON_USEDEP}]
"

distutils_enable_tests pytest

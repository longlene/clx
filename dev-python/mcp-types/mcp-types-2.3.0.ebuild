# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=hatchling
PYTHON_COMPAT=( python3_{13..15} )

inherit distutils-r1

DESCRIPTION="Model Context Protocol wire types"
HOMEPAGE="
	https://modelcontextprotocol.io
	https://github.com/modelcontextprotocol/python-sdk
"
SRC_URI="https://github.com/modelcontextprotocol/python-sdk/archive/refs/tags/v${PV}.tar.gz -> python-sdk-${PV}.gh.tar.gz"
S="${WORKDIR}"/python-sdk-${PV}/src/mcp-types

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm64"

RDEPEND="
	>=dev-python/pydantic-2.12.0[${PYTHON_USEDEP}]
	>=dev-python/typing-extensions-4.13.0[${PYTHON_USEDEP}]
"
BDEPEND="
	dev-python/uv-dynamic-versioning[${PYTHON_USEDEP}]
"

export UV_DYNAMIC_VERSIONING_BYPASS="${PV}"

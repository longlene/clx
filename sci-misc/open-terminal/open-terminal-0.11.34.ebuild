# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=hatchling
PYTHON_COMPAT=( python3_{13..15} )

inherit distutils-r1

DESCRIPTION="Remote terminal API — control your machine from HTTP"
HOMEPAGE="https://github.com/open-webui/open-terminal"
SRC_URI="https://github.com/open-webui/open-terminal/archive/refs/tags/v${PV}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE="mcp"
RESTRICT="test"

RDEPEND="
	>=dev-python/aiofiles-25.1.0[${PYTHON_USEDEP}]
	>=dev-python/click-8.1.0[${PYTHON_USEDEP}]
	>=dev-python/fastapi-0.115.0[${PYTHON_USEDEP}]
	>=dev-python/ipykernel-6.0.0[${PYTHON_USEDEP}]
	>=dev-python/nbclient-0.10.0[${PYTHON_USEDEP}]
	>=dev-python/openpyxl-3.1.0[${PYTHON_USEDEP}]
	>=dev-python/pypdf-5.0.0[${PYTHON_USEDEP}]
	>=dev-python/python-docx-1.0.0[${PYTHON_USEDEP}]
	>=dev-python/python-multipart-0.0.22[${PYTHON_USEDEP}]
	>=dev-python/python-pptx-1.0.0[${PYTHON_USEDEP}]
	>=dev-python/striprtf-0.0.26[${PYTHON_USEDEP}]
	>=dev-python/uvicorn-0.34.0[${PYTHON_USEDEP}]
	>=dev-python/xlrd-2.0.0[${PYTHON_USEDEP}]
	mcp? ( >=dev-python/fastmcp-2.0.0[${PYTHON_USEDEP}] )
"

# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=standalone
PYTHON_COMPAT=( python3_{12..14} )

inherit distutils-r1

DESCRIPTION="Create web-based user interfaces with Python"
HOMEPAGE="https://github.com/zauberzeug/nicegui"
SRC_URI="https://github.com/zauberzeug/nicegui/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	>=dev-python/poetry-dynamic-versioning-1.0.0[${PYTHON_USEDEP}]
	>=dev-python/typing-extensions-4.0.0[${PYTHON_USEDEP}]
	>=dev-python/markdown2-2.4.7[${PYTHON_USEDEP}]
	>=dev-python/pygments-2.15.1[${PYTHON_USEDEP}]
	>=dev-python/starlette-0.49.1[${PYTHON_USEDEP}]
	>=dev-python/uvicorn-0.22.0[${PYTHON_USEDEP}]
	>=dev-python/fastapi-0.109.1[${PYTHON_USEDEP}]
	>=dev-python/python-socketio-5.14.0[${PYTHON_USEDEP}]
	>=dev-python/jinja2-3.1.6[${PYTHON_USEDEP}]
	>=dev-python/python-multipart-0.0.18[${PYTHON_USEDEP}]
	>=dev-python/orjson-3.9.15[${PYTHON_USEDEP}]
	>=dev-python/itsdangerous-2.1.2[${PYTHON_USEDEP}]
	>=dev-python/aiofiles-23.1.0[${PYTHON_USEDEP}]
	>=dev-python/httpx-0.24.0[${PYTHON_USEDEP}]
	>=dev-python/ifaddr-0.2.0[${PYTHON_USEDEP}]
	>=dev-python/docutils-0.19.0[${PYTHON_USEDEP}]
	>=dev-python/watchfiles-0.18.1[${PYTHON_USEDEP}]
	>=dev-python/h11-0.16.0[${PYTHON_USEDEP}]
	>=dev-python/python-engineio-4.12.0[${PYTHON_USEDEP}]
	>=dev-python/aiohttp-3.10.2[${PYTHON_USEDEP}]
	>=dev-python/certifi-2024.07.04[${PYTHON_USEDEP}]
	>=dev-python/pydantic-core-2.35.0[${PYTHON_USEDEP}]
"
#BDEPEND="
#	test? (
#	)
#"

distutils_enable_tests pytest

export POETRY_DYNAMIC_VERSIONING_OVERRIDE="nicegui=${PV}"

# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=pdm-backend
PYTHON_COMPAT=( python3_{13..15} )

inherit distutils-r1 pypi

DESCRIPTION="Server component for the Computer-Use Interface (CUI) framework powering Cua"
HOMEPAGE="
	https://github.com/trycua/cua
	https://pypi.org/project/cua-computer-server/
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

# upstream pins grpcio/protobuf exactly and caps fastmcp <3.3.0;
# relaxed to lower bounds
RDEPEND="
	>=dev-python/aiohttp-3.9.1[${PYTHON_USEDEP}]
	>=dev-python/fastapi-0.111.0[${PYTHON_USEDEP}]
	>=dev-python/fastmcp-3.2.0[${PYTHON_USEDEP}]
	>=dev-python/grpcio-1.78.0[${PYTHON_USEDEP}]
	>=dev-python/pillow-10.2.0[${PYTHON_USEDEP}]
	>=dev-python/playwright-1.40.0[${PYTHON_USEDEP}]
	>=dev-python/protobuf-6.33.6[${PYTHON_USEDEP}]
	>=dev-python/pydantic-2.0.0[${PYTHON_USEDEP}]
	>=dev-python/pynput-1.8.1[${PYTHON_USEDEP}]
	>=dev-python/pyperclip-1.9.0[${PYTHON_USEDEP}]
	>=dev-python/python-xlib-0.33[${PYTHON_USEDEP}]
	>=dev-python/pywinctl-0.4.1[${PYTHON_USEDEP}]
	>=dev-python/uvicorn-0.27.0[${PYTHON_USEDEP}]
	dev-python/httptools[${PYTHON_USEDEP}]
	dev-python/python-dotenv[${PYTHON_USEDEP}]
	dev-python/pyyaml[${PYTHON_USEDEP}]
	dev-python/uvloop[${PYTHON_USEDEP}]
	dev-python/watchfiles[${PYTHON_USEDEP}]
	>=dev-python/websockets-12.0[${PYTHON_USEDEP}]
	>=sci-ml/cua-auto-0.1.0[${PYTHON_USEDEP}]
	>=sci-ml/cua-core-0.3.0[${PYTHON_USEDEP}]
	<sci-ml/cua-core-0.4.0[${PYTHON_USEDEP}]
"

EPYTEST_PLUGINS=( pytest-asyncio )

distutils_enable_tests pytest

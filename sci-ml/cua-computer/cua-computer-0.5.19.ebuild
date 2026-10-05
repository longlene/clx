# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=pdm-backend
PYTHON_COMPAT=( python3_{13..15} )

inherit distutils-r1 pypi

DESCRIPTION="Computer-Use Interface (CUI) framework powering Cua"
HOMEPAGE="
	https://github.com/trycua/cua
	https://pypi.org/project/cua-computer/
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	>=dev-python/aiohttp-3.9.0[${PYTHON_USEDEP}]
	>=dev-python/mslex-1.3.0[${PYTHON_USEDEP}]
	>=dev-python/pillow-10.0.0[${PYTHON_USEDEP}]
	>=dev-python/pydantic-2.11.1[${PYTHON_USEDEP}]
	>=dev-python/websocket-client-1.8.0[${PYTHON_USEDEP}]
	>=dev-python/websockets-12.0[${PYTHON_USEDEP}]
	>=sci-ml/cua-core-0.3.0[${PYTHON_USEDEP}]
	<sci-ml/cua-core-0.4.0[${PYTHON_USEDEP}]
"

EPYTEST_PLUGINS=( pytest-asyncio )

distutils_enable_tests pytest

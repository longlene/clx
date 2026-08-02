# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=uv-build
PYTHON_COMPAT=( python3_{13..15} )

inherit distutils-r1

DESCRIPTION="Asynchronous multi-platform chatbot framework written in Python"
HOMEPAGE="
	https://nonebot.dev/
	https://github.com/nonebot/nonebot2
"
SRC_URI="https://github.com/nonebot/nonebot2/archive/refs/tags/v${PV}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE="aiohttp fastapi quart websockets"
RESTRICT="test"

RDEPEND="
	>=dev-python/anyio-4.4.0[${PYTHON_USEDEP}]
	>=dev-python/exceptiongroup-1.2.2[${PYTHON_USEDEP}]
	>=dev-python/loguru-0.6.0[${PYTHON_USEDEP}]
	>=dev-python/pydantic-1.10.0[${PYTHON_USEDEP}]
	>=dev-python/pygtrie-2.4.1[${PYTHON_USEDEP}]
	>=dev-python/python-dotenv-0.21.0[${PYTHON_USEDEP}]
	>=dev-python/typing-extensions-4.6.0[${PYTHON_USEDEP}]
	>=dev-python/yarl-1.7.2[${PYTHON_USEDEP}]
	aiohttp? ( >=dev-python/aiohttp-3.11.0[${PYTHON_USEDEP}] )
	fastapi? (
		>=dev-python/fastapi-0.93.0[${PYTHON_USEDEP}]
		>=dev-python/uvicorn-0.20.0[${PYTHON_USEDEP}]
	)
quart? (
		>=dev-python/quart-0.18.0[${PYTHON_USEDEP}]
		>=dev-python/uvicorn-0.20.0[${PYTHON_USEDEP}]
	)
	websockets? ( >=dev-python/websockets-15.0[${PYTHON_USEDEP}] )
"

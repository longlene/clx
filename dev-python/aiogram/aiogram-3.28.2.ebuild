# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=hatchling
PYTHON_COMPAT=( python3_{11..14} )

inherit distutils-r1

DESCRIPTION="Modern and fully asynchronous framework for Telegram Bot API"
HOMEPAGE="https://aiogram.dev/ https://github.com/aiogram/aiogram https://pypi.org/project/aiogram/"
SRC_URI="https://github.com/aiogram/aiogram/archive/refs/tags/v${PV}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE="fast i18n redis signature"

RESTRICT="test"

RDEPEND="
	>=dev-python/magic-filter-1.0.12[${PYTHON_USEDEP}]
	<dev-python/magic-filter-1.1[${PYTHON_USEDEP}]
	>=dev-python/aiohttp-3.9.0[${PYTHON_USEDEP}]
	<dev-python/aiohttp-3.14[${PYTHON_USEDEP}]
	>=dev-python/pydantic-2.4.1[${PYTHON_USEDEP}]
	<dev-python/pydantic-2.14[${PYTHON_USEDEP}]
	>=dev-python/aiofiles-23.2.1[${PYTHON_USEDEP}]
	>=dev-python/certifi-2023.7.22[${PYTHON_USEDEP}]
	>=dev-python/typing-extensions-4.7.0[${PYTHON_USEDEP}]
	<dev-python/typing-extensions-5.1[${PYTHON_USEDEP}]
	fast? (
		>=dev-python/uvloop-0.21.0[${PYTHON_USEDEP}]
		>=dev-python/aiodns-3.0.0[${PYTHON_USEDEP}]
	)
	i18n? ( >=dev-python/babel-2.13.0[${PYTHON_USEDEP}] )
	redis? ( >=dev-python/redis-6.2.0[${PYTHON_USEDEP}] )
	signature? ( >=dev-python/cryptography-46.0.0[${PYTHON_USEDEP}] )
"

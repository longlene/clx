# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{11..12} )

inherit distutils-r1

DESCRIPTION="An API wrapper for Discord written in Python"
HOMEPAGE="https://github.com/DisnakeDev/disnake"
SRC_URI="https://github.com/DisnakeDev/disnake/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	>=dev-python/aiohttp-3.7.0[${PYTHON_USEDEP}]
"
BDEPEND="
	test? (
		>=dev-python/pytest-asyncio-0.20.3[${PYTHON_USEDEP}]
	)
"

distutils_enable_tests pytest

# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{11..14} )

inherit distutils-r1

DESCRIPTION="An API wrapper for Discord written in Python"
HOMEPAGE="https://github.com/Rapptz/discord.py"
SRC_URI="https://github.com/Rapptz/discord.py/archive/refs/tags/v${PV}.tar.gz -> discord.py-${PV}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	>=dev-python/aiohttp-3.7.4[${PYTHON_USEDEP}]
	dev-python/audioop-lts[${PYTHON_USEDEP}]
"
BDEPEND=""

S="${WORKDIR}"/discord.py-${PV}

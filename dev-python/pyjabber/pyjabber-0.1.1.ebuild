# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{11..13} )

inherit distutils-r1

DESCRIPTION="A Python XMPP server"
HOMEPAGE="https://github.com/DinoThor/PyJabber"
SRC_URI="https://github.com/DinoThor/PyJabber/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	>=dev-python/aiohttp-3.9.5[${PYTHON_USEDEP}]
	>=dev-python/loguru-0.7.2[${PYTHON_USEDEP}]
	>=dev-python/xmlschema-3.3.0[${PYTHON_USEDEP}]
"
BDEPEND="
	test? (
		>=dev-python/pytest-asyncio-0.21.0[${PYTHON_USEDEP}]
	)
"

distutils_enable_tests pytest

S="${WORKDIR}"/PyJabber-${PV}

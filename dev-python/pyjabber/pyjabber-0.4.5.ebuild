# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{13..15} )

inherit distutils-r1

DESCRIPTION="A lightweight, modular and asyncio XMPP/Jabber server written in Python"
HOMEPAGE="https://github.com/DinoThor/PyJabber"
SRC_URI="https://github.com/DinoThor/PyJabber/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

S="${WORKDIR}/PyJabber-${PV}"
LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	$(python_gen_cond_dep '
		>=dev-python/aiofiles-25.1.0[${PYTHON_USEDEP}]
		>=dev-python/aiohttp-3.13.3[${PYTHON_USEDEP}]
		>=dev-python/aiosqlite-0.22.1[${PYTHON_USEDEP}]
		>=dev-python/alembic-1.16.5[${PYTHON_USEDEP}]
		>=dev-python/bcrypt-5.0.0[${PYTHON_USEDEP}]
		>=dev-python/click-8.1.8[${PYTHON_USEDEP}]
		>=dev-python/cryptography-46.0.4[${PYTHON_USEDEP}]
		>=dev-python/loguru-0.7.3[${PYTHON_USEDEP}]
		>=dev-python/pyyaml-6.0.3[${PYTHON_USEDEP}]
		>=dev-python/sqlalchemy-2.0.46[${PYTHON_USEDEP}]
		>=dev-python/uvloop-0.21.0[${PYTHON_USEDEP}]
	')
"
BDEPEND="
	test? (
		$(python_gen_cond_dep '
			>=dev-python/pytest-asyncio-0.23.8[${PYTHON_USEDEP}]
			dev-python/pytest-cov[${PYTHON_USEDEP}]
			>=dev-python/slixmpp-1.8.6[${PYTHON_USEDEP}]
		')
	)
"

distutils_enable_tests pytest

# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=hatchling
PYTHON_COMPAT=( python3_{13..15} )

inherit distutils-r1

DESCRIPTION="An IMAP server that uses mailbox.MH as its storage"
HOMEPAGE="https://github.com/scanner/asimap"
SRC_URI="https://github.com/scanner/asimap/archive/refs/tags/${PV}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	dev-python/aiofiles[${PYTHON_USEDEP}]
	dev-python/aioretry[${PYTHON_USEDEP}]
	dev-python/aiosqlite[${PYTHON_USEDEP}]
	dev-python/charset-normalizer[${PYTHON_USEDEP}]
	dev-python/docopt-ng[${PYTHON_USEDEP}]
	dev-python/python-dotenv[${PYTHON_USEDEP}]
	dev-python/python-json-logger[${PYTHON_USEDEP}]
	dev-python/sentry-sdk[${PYTHON_USEDEP}]
"
EPYTEST_PLUGINS=( pytest-asyncio pytest-mock )
BDEPEND="
	${DISTUTILS_DEPS}
	test? (
		dev-python/dirty-equals[${PYTHON_USEDEP}]
		dev-python/factory-boy[${PYTHON_USEDEP}]
		dev-python/faker[${PYTHON_USEDEP}]
		dev-python/trustme[${PYTHON_USEDEP}]
	)
"

distutils_enable_tests pytest

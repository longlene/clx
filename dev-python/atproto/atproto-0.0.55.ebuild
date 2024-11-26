# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=poetry
PYTHON_COMPAT=( python3_{11..13} )

inherit distutils-r1

DESCRIPTION="The AT Protocol SDK"
HOMEPAGE="https://github.com/MarshalX/atproto"
SRC_URI="https://github.com/MarshalX/atproto/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	>=dev-python/httpx-0.25.0[${PYTHON_USEDEP}]
	>=dev-python/typing-extensions-4.8.0[${PYTHON_USEDEP}]
	>=dev-python/click-8.1.3[${PYTHON_USEDEP}]
	>=dev-python/websockets-12[${PYTHON_USEDEP}]
	>=dev-python/pydantic-2.7[${PYTHON_USEDEP}]
	>=dev-python/libipld-2.0.0[${PYTHON_USEDEP}]
	>=dev-python/dnspython-2.4.0[${PYTHON_USEDEP}]
	>=dev-python/cryptography-41.0.7[${PYTHON_USEDEP}]
"
BDEPEND="
	test? (
		>=dev-python/pytest-asyncio-0.22.0[${PYTHON_USEDEP}]
		>=dev-python/coverage-7.3[${PYTHON_USEDEP}]
	)
"

distutils_enable_tests pytest

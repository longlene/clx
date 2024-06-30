# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=poetry
PYTHON_COMPAT=( python3_{11..12} )
inherit distutils-r1

EGIT_COMMIT="da6b2fe5231fd5f8a8633ed11a05ef24c8e7223d"

DESCRIPTION="XMPP bridging framework"
HOMEPAGE="https://sr.ht/~nicoco/slidge/"
SRC_URI="https://git.sr.ht/~nicoco/slidge/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="AGPL-3.0"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	>=dev-python/qrcode-7.4.1[${PYTHON_USEDEP}]
	>=dev-python/Pillow-10[${PYTHON_USEDEP}]
	>=dev-python/aiohttp-3.8.3[${PYTHON_USEDEP}]
	>=dev-python/ConfigArgParse-1.5.3[${PYTHON_USEDEP}]
	>=dev-python/pickle-secure-0.99.9[${PYTHON_USEDEP}]
	>=dev-python/python-magic-0.4.27[${PYTHON_USEDEP}]
	>=dev-python/slixmpp-1.8.5[${PYTHON_USEDEP}]
	>=dev-python/blurhash-python-1.2.1[${PYTHON_USEDEP}]
"
BDEPEND="
	test? (
		dev-python/pytest-asyncio[${PYTHON_USEDEP}]
	)
"

distutils_enable_tests pytest

S="${WORKDIR}"/${PN}-${EGIT_COMMIT}

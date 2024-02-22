# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{11..12} )

inherit distutils-r1

DESCRIPTION="OpenSSL Transport for asyncio"
HOMEPAGE="https://github.com/horazont/aioopenssl"
SRC_URI="https://github.com/horazont/aioopenssl/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	dev-python/pyopenssl[${PYTHON_USEDEP}]
"
BDEPEND=""

RESTRICT="test"

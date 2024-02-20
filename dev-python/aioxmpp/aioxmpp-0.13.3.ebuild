# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{11..12} )

inherit distutils-r1

DESCRIPTION="An XMPP library for use with Python asyncio"
HOMEPAGE="https://codeberg.org/jssfr/aioxmpp"
SRC_URI="https://github.com/horazont/aioxmpp/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="LGPL-3+"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	>=dev-python/aiosasl-0.3[${PYTHON_USEDEP}]
	>=dev-python/aioopenssl-0.1[${PYTHON_USEDEP}]
	>=dev-python/babel-2.3[${PYTHON_USEDEP}]
	>=dev-python/dnspython-1.0[${PYTHON_USEDEP}]
	>=dev-python/lxml-4.0[${PYTHON_USEDEP}]
	>=dev-python/multidict-2.0[${PYTHON_USEDEP}]
	>=dev-python/sortedcollections-2.1[${PYTHON_USEDEP}]
	dev-python/pyopenssl[${PYTHON_USEDEP}]
	dev-python/pyasn1[${PYTHON_USEDEP}]
	dev-python/pyasn1-modules[${PYTHON_USEDEP}]
	>=dev-python/tzlocal-1.2[${PYTHON_USEDEP}]
"
BDEPEND=""

RESTRICT="test"

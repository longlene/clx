# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_1{3..4} )

inherit distutils-r1 pypi

DESCRIPTION="XMPP implementation in Python"
HOMEPAGE="https://github.com/xmpppy/xmpppy"
SRC_URI="https://github.com/xmpppy/xmpppy/archive/refs/tags/${PV}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="GPL"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	dev-python/six[${PYTHON_USEDEP}]
"
BDEPEND=""

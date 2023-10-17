# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_1{1..2} )

inherit distutils-r1 pypi

DESCRIPTION="XMPP implementation in Python"
HOMEPAGE="https://github.com/xmpppy/xmpppy"

LICENSE="GPL"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
"
BDEPEND=""

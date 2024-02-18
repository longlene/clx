# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_1{1..2} )

inherit distutils-r1

DESCRIPTION="Python bindings to libpurple"
HOMEPAGE="https://github.com/Flared/python-purple"
SRC_URI="https://github.com/Flared/python-purple/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64"

DEPEND="
	net-im/pidgin
	>=dev-python/cython-0.29.21[${PYTHON_USEDEP}]
"
RDEPEND="
"
BDEPEND="
	test? (
		>=dev-python/pytest-xdist-1.29.0[${PYTHON_USEDEP}]
	)
"

distutils_enable_tests pytest

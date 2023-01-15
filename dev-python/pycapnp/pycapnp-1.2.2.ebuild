# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_10 )
inherit distutils-r1

DESCRIPTION="A cython wrapping of the C++ Cap'n Proto library"
HOMEPAGE="https://github.com/capnproto/pycapnp"
SRC_URI="https://github.com/capnproto/pycapnp/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND=""
BDEPEND="
	dev-libs/capnproto
	dev-python/cython[${PYTHON_USEDEP}]
	dev-python/pkgconfig[${PYTHON_USEDEP}]
	virtual/pkgconfig
"

distutils_enable_tests pytest

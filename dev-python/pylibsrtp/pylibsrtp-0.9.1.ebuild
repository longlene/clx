# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{11,12} )

inherit distutils-r1 pypi

DESCRIPTION="Python bindings for libsrtp"
HOMEPAGE="https://github.com/aiortc/pylibsrtp"
SRC_URI="https://github.com/aiortc/pylibsrtp/archive/refs/tags/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD-3"
SLOT="0"
KEYWORDS="~amd64"

DEPEND="net-libs/libsrtp"
RDEPEND="
	>=dev-python/cffi-1.0.0[${PYTHON_USEDEP}]
"
BDEPEND=""


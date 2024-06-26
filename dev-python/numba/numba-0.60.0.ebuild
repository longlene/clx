# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_1{1..3} )

inherit distutils-r1 pypi

DESCRIPTION="NumPy aware dynamic Python compiler using LLVM"
HOMEPAGE="http://numba.pydata.org/"
SRC_URI="https://github.com/numba/numba/archive/refs/tags/0.58.1.tar.gz -> ${P}.tar.gz"

LICENSE="BSD-2"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
"
BDEPEND=""

distutils_enable_tests pytest

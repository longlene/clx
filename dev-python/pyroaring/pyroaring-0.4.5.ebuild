# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{13..15} )
DISTUTILS_EXT=1

inherit distutils-r1

DESCRIPTION="Python library for handling efficiently sorted integer sets"
HOMEPAGE="https://github.com/Ezibenroc/PyRoaringBitMap"
SRC_URI="https://github.com/Ezibenroc/PyRoaringBitMap/archive/refs/tags/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
S="${WORKDIR}"/PyRoaringBitMap-${PV}
KEYWORDS="~amd64"

BDEPEND="
	dev-python/cython[${PYTHON_USEDEP}]
"

distutils_enable_tests pytest

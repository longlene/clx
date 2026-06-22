# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_EXT=1
DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{13..15} )

inherit distutils-r1

LIBDATRIE_COMMIT="d1dfdb831093892541cae46eba82c46aec94f726"

DESCRIPTION="Fast, efficiently stored Trie for Python"
HOMEPAGE="
	https://pypi.org/project/datrie/
	https://github.com/pytries/datrie
"
SRC_URI="
	https://github.com/pytries/datrie/archive/refs/tags/${PV}.tar.gz -> ${P}.gh.tar.gz
	https://github.com/tlwg/libdatrie/archive/${LIBDATRIE_COMMIT}.tar.gz -> $libdatrie-${LIBDATRIE_COMMIT}.tar.gz
"

LICENSE="LGPL-2.1+"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	>=dev-python/cython-0.28[${PYTHON_USEDEP}]
"
#BDEPEND="
#	test? (
#	)
#"

EPYTEST_PLUGINS=()
distutils_enable_tests pytest

src_prepare() {
	rmdir libdatrie && ln -sv "${WORKDIR}"/libdatrie-${LIBDATRIE_COMMIT} libdatrie
	distutils-r1_src_prepare
}

# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_EXT=1
DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{13..14} )

inherit distutils-r1

DESCRIPTION="Memray is a memory profiler for Python"
HOMEPAGE="
	https://pypi.org/project/memray/
	https://github.com/bloomberg/memray
"
SRC_URI="https://github.com/bloomberg/memray/archive/refs/tags/v${PV}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	>=dev-python/jinja22-2.9[${PYTHON_USEDEP}]
	>=dev-python/rich-11.2.0[${PYTHON_USEDEP}]
	>=dev-python/textual-0.41.0[${PYTHON_USEDEP}]
"
BDEPEND="
	dev-python/pkgconfig[${PYTHON_USEDEP}]
	dev-python/cython[${PYTHON_USEDEP}]
"
#BDEPEND="
#	test? (
#	)
#"

EPYTEST_PLUGINS=()
distutils_enable_tests pytest

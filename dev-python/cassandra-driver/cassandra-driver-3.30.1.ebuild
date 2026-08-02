# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_EXT=1
DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{13..15} )

inherit distutils-r1

DESCRIPTION="Apache Cassandra Python Driver"
HOMEPAGE="
	https://pypi.org/project/cassandra-driver/
	https://github.com/apache/cassandra-python-driver
"
SRC_URI="https://github.com/apache/cassandra-python-driver/archive/refs/tags/${PV}.tar.gz -> ${P}.gh.tar.gz"

S="${WORKDIR}"/cassandra-python-driver-${PV}

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"
IUSE="graph"

RDEPEND="
	>=dev-python/geomet-1.1[${PYTHON_USEDEP}]
	>=dev-python/deprecated-1.3.1[${PYTHON_USEDEP}]
	graph? ( dev-python/gremlinpython[${PYTHON_USEDEP}] )
"
BDEPEND="
	>=dev-python/cython-3.0[${PYTHON_USEDEP}]
"

EPYTEST_PLUGINS=()
distutils_enable_tests pytest

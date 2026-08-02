# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=hatchling
PYTHON_COMPAT=( python3_{13..15} )

inherit distutils-r1

DESCRIPTION="Probabilistic data structures for processing and searching very large datasets"
HOMEPAGE="https://github.com/ekzhu/datasketch"
SRC_URI="https://github.com/ekzhu/datasketch/archive/refs/tags/v${PV}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE="cassandra redis"
RESTRICT="test"

RDEPEND="
	dev-python/numpy[${PYTHON_USEDEP}]
	dev-python/scipy[${PYTHON_USEDEP}]
	cassandra? ( >=dev-python/cassandra-driver-3.20[${PYTHON_USEDEP}] )
	redis? ( >=dev-python/redis-2.10.0[${PYTHON_USEDEP}] )
"

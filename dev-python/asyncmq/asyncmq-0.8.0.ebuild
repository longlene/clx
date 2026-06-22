# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=hatchling
PYTHON_COMPAT=( python3_{13..15} )

inherit distutils-r1

DESCRIPTION="Async task queue with scheduling, rate limiting, and dead-letter support"
HOMEPAGE="
	https://github.com/dymmond/asyncmq
	https://asyncmq.dymmond.com
"
SRC_URI="https://github.com/dymmond/asyncmq/archive/refs/tags/${PV}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64"
IUSE="postgres"
RESTRICT="test"

RDEPEND="
	$(python_gen_cond_dep '
		>=dev-python/croniter-6.0.0[${PYTHON_USEDEP}]
		dev-python/lilya[${PYTHON_USEDEP}]
		dev-python/sayer[${PYTHON_USEDEP}]
		>=dev-python/redis-7.0.0[${PYTHON_USEDEP}]
		postgres? ( >=dev-python/asyncpg-0.30.0[${PYTHON_USEDEP}] )
	')
"

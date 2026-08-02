# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{13..15} )

inherit distutils-r1

DESCRIPTION="Peewee ORM integration for Muffin framework"
HOMEPAGE="https://github.com/klen/muffin-peewee https://pypi.org/project/muffin-peewee-aio/"
SRC_URI="https://github.com/klen/muffin-peewee/archive/refs/tags/${PV}.tar.gz -> ${P}.gh.tar.gz"

S="${WORKDIR}/muffin-peewee-${PV}"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE="postgres"
RESTRICT="test"

RDEPEND="
	>=dev-python/aio-peewee-0.4.0[${PYTHON_USEDEP}]
	>=dev-python/muffin-0.83[${PYTHON_USEDEP}]
	>=dev-python/peewee-3[${PYTHON_USEDEP}]
	>=dev-python/peewee-migrate-1.6.2[${PYTHON_USEDEP}]
	postgres? ( dev-python/psycopg2[${PYTHON_USEDEP}] )
"

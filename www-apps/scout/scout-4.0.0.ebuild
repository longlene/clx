# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{13..15} )

inherit distutils-r1

DESCRIPTION="Lightweight RESTful search server powered by SQLite"
HOMEPAGE="https://scout.readthedocs.io/ https://github.com/coleifer/scout"
SRC_URI="https://github.com/coleifer/scout/archive/refs/tags/${PV}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE="gevent"

RDEPEND="$(python_gen_cond_dep '
	dev-python/flask[${PYTHON_USEDEP}]
	>=dev-python/peewee-3.0.0[${PYTHON_USEDEP}]
	gevent? ( dev-python/gevent[${PYTHON_USEDEP}] )
')"

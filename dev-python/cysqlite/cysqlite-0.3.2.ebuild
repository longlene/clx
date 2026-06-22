# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_EXT=1
DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{13..15} )

inherit distutils-r1

DESCRIPTION="Cython-based SQLite3 database driver"
HOMEPAGE="https://cysqlite.readthedocs.io/ https://github.com/coleifer/cysqlite"
SRC_URI="https://github.com/coleifer/cysqlite/archive/refs/tags/${PV}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
RESTRICT="test"

DEPEND="dev-db/sqlite:3="
RDEPEND="${DEPEND}"
BDEPEND="$(python_gen_cond_dep '
	dev-python/cython[${PYTHON_USEDEP}]
')"

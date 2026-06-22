# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{13..15} )

inherit distutils-r1

DESCRIPTION="Lightweight and efficient caching library for Python"
HOMEPAGE="https://github.com/coleifer/ucache"
SRC_URI="https://github.com/coleifer/ucache/archive/refs/tags/${PV}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE="msgpack pylibmc redis sqlite"

RDEPEND="$(python_gen_cond_dep '
	msgpack? ( dev-python/msgpack[${PYTHON_USEDEP}] )
	pylibmc? ( dev-python/pylibmc[${PYTHON_USEDEP}] )
	redis? ( dev-python/redis[${PYTHON_USEDEP}] )
	sqlite? ( dev-python/peewee[${PYTHON_USEDEP}] )
')"

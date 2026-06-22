# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{13..15} )

inherit distutils-r1

DESCRIPTION="Utilities for working with Redis"
HOMEPAGE="https://walrus.readthedocs.io/ https://github.com/coleifer/walrus"
SRC_URI="https://github.com/coleifer/walrus/archive/refs/tags/${PV}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="$(python_gen_cond_dep '
	dev-python/redis[${PYTHON_USEDEP}]
')"

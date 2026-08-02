# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=hatchling
PYTHON_COMPAT=( python3_{13..15} )

inherit distutils-r1

DESCRIPTION="Pytest plugin for testing async python code"
HOMEPAGE="https://github.com/klen/pytest-aio"
SRC_URI="https://github.com/klen/pytest-aio/archive/refs/tags/${PV}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE="curio trio uvloop"
RESTRICT="test"

RDEPEND="
	dev-python/pytest[${PYTHON_USEDEP}]
	curio? ( dev-python/curio-compat[${PYTHON_USEDEP}] )
	trio? ( dev-python/trio[${PYTHON_USEDEP}] )
	uvloop? ( dev-python/uvloop[${PYTHON_USEDEP}] )
"

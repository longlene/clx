# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=hatchling
PYTHON_COMPAT=( python3_{13..14} )

inherit distutils-r1

DESCRIPTION="Compression middleware for Starlette"
HOMEPAGE="
	https://pypi.org/project/starlette-compress/
	https://github.com/Zaczero/starlette-compress
"
SRC_URI="https://github.com/Zaczero/starlette-compress/archive/refs/tags/${PV}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	dev-python/brotli[${PYTHON_USEDEP}]
	dev-python/starlette[${PYTHON_USEDEP}]
"
#BDEPEND="
#	test? (
#	)
#"

EPYTEST_PLUGINS=()
distutils_enable_tests pytest

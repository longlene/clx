# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_EXT=1
DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{13..14} )

inherit distutils-r1

DESCRIPTION="Cython memory pool for RAII-style memory management"
HOMEPAGE="https://github.com/explosion/cymem"
SRC_URI="https://github.com/explosion/cymem/archive/refs/tags/release-v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND=""
BDEPEND="
	>=dev-python/cython-0.25[${PYTHON_USEDEP}]
"

distutils_enable_tests pytest

S="${WORKDIR}"/${PN}-release-v${PV}

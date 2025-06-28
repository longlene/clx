# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{13..14} )

inherit distutils-r1

DESCRIPTION="A refreshing functional take on deep learning"
HOMEPAGE="https://github.com/explosion/thinc"
SRC_URI="https://github.com/explosion/thinc/archive/refs/tags/release-v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND=""
BDEPEND="
	>=dev-python/cython-0.25[${PYTHON_USEDEP}]
	>=dev-python/murmurhash-1.0.2[${PYTHON_USEDEP}]
	>=dev-python/cymem-2.0.2[${PYTHON_USEDEP}]
	>=dev-python/preshed-3.0.2[${PYTHON_USEDEP}]
	>=dev-python/blis-1.0.0[${PYTHON_USEDEP}]
	>=dev-python/numpy-2.0.0[${PYTHON_USEDEP}]
"

distutils_enable_tests pytest

S="${WORKDIR}"/${PN}-release-v${PV}

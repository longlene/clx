# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{13..14} )

inherit distutils-r1

DESCRIPTION="Cython hash tables that assume keys are pre-hashed"
HOMEPAGE="
	https://pypi.org/project/preshed/
	https://github.com/explosion/preshed
"
SRC_URI="https://github.com/explosion/preshed/archive/refs/tags/release-v${PV}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
"
BDEPEND="
	>=dev-python/cython-0.28[${PYTHON_USEDEP}]
	>=dev-python/cymem-2.0.2[${PYTHON_USEDEP}]
	>=dev-python/murmurhash-0.28.0[${PYTHON_USEDEP}]
"

EPYTEST_PLUGINS=()
distutils_enable_tests pytest

S="${WORKDIR}"/preshed-release-v${PV}


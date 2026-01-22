# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=standalone
PYTHON_COMPAT=( python3_{13..14} )

inherit distutils-r1

DESCRIPTION="CMake Python Distributions"
HOMEPAGE="
	https://pypi.org/project/cmake/
	https://github.com/scikit-build/cmake-python-distributions
"
SRC_URI="
	https://github.com/scikit-build/cmake-python-distributions/archive/refs/tags/${PV}.tar.gz -> cmake-python-distributions-${PV}.gh.tar.gz
"
#	https://github.com/Kitware/CMake/releases/download/v${PV}/cmake-${PV}.tar.gz

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	dev-build/cmake
"
BDEPEND="
	dev-python/scikit-build-core[${PYTHON_USEDEP}]
"
#BDEPEND="
#	test? (
#	)
#"

EPYTEST_PLUGINS=()
distutils_enable_tests pytest

S="${WORKDIR}"/cmake-python-distributions-${PV}

PATCHES=(
	"${FILESDIR}"/build-fix.patch
)

export CMakeProject_SOURCE_DIR="${WORKDIR}"/cmake-${PV}

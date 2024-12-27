# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=standalone
PYTHON_COMPAT=( python3_{11..13} )

inherit distutils-r1

MY_P="ninja-python-distributions-${PV}"
NINJA_PV="1.12.1"

DESCRIPTION="Ninja Python wheels based on system ninja"
HOMEPAGE="
	https://pypi.org/project/ninja/
	https://github.com/scikit-build/ninja-python-distributions
"
SRC_URI="
	https://github.com/scikit-build/ninja-python-distributions/archive/refs/tags/${PV}.tar.gz -> ninja-python-distributions-${PV}.gh.tar.gz
	https://github.com/ninja-build/ninja/archive/v${NINJA_PV}.tar.gz -> ninja-${NINJA_PV}.tar.gz
"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	app-alternatives/ninja
"

RESTRICT="test"

S="${WORKDIR}"/${MY_P}

PATCHES=(
	"${FILESDIR}"/system-ninja.patch
)

export ninja_SOURCE_DIR="${WORKDIR}"/ninja-${NINJA_PV}

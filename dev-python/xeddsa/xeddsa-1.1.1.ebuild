# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_EXT=1
DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{13..14} )

inherit distutils-r1

DESCRIPTION="Python bindings to libxeddsa"
HOMEPAGE="
	https://pypi.org/project/python-xeddsa/
	https://github.com/Syndace/python-xeddsa/
"
SRC_URI="https://github.com/Syndace/python-xeddsa/archive/refs/tags/v${PV}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

DEPEND="dev-libs/libxeddsa"
RDEPEND="
	>=dev-python/cffi-1.14.5[${PYTHON_USEDEP}]
"
#BDEPEND="
#	test? (
#	)
#"

EPYTEST_PLUGINS=()
distutils_enable_tests pytest

S="${WORKDIR}"/python-${P}

PATCHES=(
	"${FILESDIR}"/build-fix.patch
)

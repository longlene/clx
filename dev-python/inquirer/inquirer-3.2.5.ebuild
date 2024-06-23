# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=poetry
PYTHON_COMPAT=( python3_{12..13} )

inherit distutils-r1

DESCRIPTION="Collection of common interactive command line user interfaces"
HOMEPAGE="
	https://github.com/magmax/python-inquirer
	https://pypi.org/project/inquirer/
"
SRC_URI="https://github.com/magmax/python-inquirer/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	>=dev-python/blessed-1.19.0[${PYTHON_USEDEP}]
	>=dev-python/readchar-3.0.6[${PYTHON_USEDEP}]
	>=dev-python/editor-1.6.0[${PYTHON_USEDEP}]
"
#BDEPEND="
#	test? (
#	)
#"
#
#distutils_enable_tests pytest
RESTRICT="test"

S="${WORKDIR}"/python-${P}

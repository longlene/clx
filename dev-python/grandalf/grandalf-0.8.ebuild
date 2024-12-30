# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{11..13} )

inherit distutils-r1

DESCRIPTION="Graph and drawing algorithms framework"
HOMEPAGE="
	https://github.com/bdcht/grandalf
	https://pypi.org/project/grandalf/
"
SRC_URI="https://github.com/bdcht/grandalf/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="|| ( GPL-2.0 EPL-1 )"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	dev-python/pyparsing[${PYTHON_USEDEP}]
"
BDEPEND=""

distutils_enable_tests pytest

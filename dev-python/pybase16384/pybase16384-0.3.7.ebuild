# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=hatchling
PYTHON_COMPAT=( python3_12 )

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
	https://pypi.org/project/pybase16384/
"
SRC_URI="https://github.com/synodriver/pybase16384/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE=""
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
"
#BDEPEND="
#	test? (
#	)
#"

distutils_enable_tests pytest

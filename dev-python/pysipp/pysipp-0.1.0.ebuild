# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_1{1..2} )

inherit distutils-r1

DESCRIPTION="A SIPp scenario launcher"
HOMEPAGE="https://github.com/SIPp/pysipp"
SRC_URI="https://github.com/SIPp/pysipp/archive/refs/tags/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	>=dev-python/pluggy-1.0.0[${PYTHON_USEDEP}]
"
BDEPEND=""

distutils_enable_tests pytest

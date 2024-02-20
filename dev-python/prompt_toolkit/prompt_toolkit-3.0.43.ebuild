# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_1{1..2} )

inherit distutils-r1

DESCRIPTION="Library for building powerful interactive command line applications in Python"
HOMEPAGE="https://github.com/prompt-toolkit/python-prompt-toolkit"
SRC_URI="https://github.com/prompt-toolkit/python-prompt-toolkit/archive/refs/tags/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD-3"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	dev-python/wcwidth[${PYTHON_USEDEP}]
"
BDEPEND=""

RESTRICT="test"

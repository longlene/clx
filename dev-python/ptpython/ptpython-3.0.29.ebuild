# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{11..13} )

inherit distutils-r1

DESCRIPTION="A better Python REPL"
HOMEPAGE="https://github.com/prompt-toolkit/ptpython"
SRC_URI="https://github.com/prompt-toolkit/ptpython/archive/refs/tags/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD-3"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	dev-python/appdirs[${PYTHON_USEDEP}]
	>=dev-python/jedi-0.16.0[${PYTHON_USEDEP}]
	>=dev-python/prompt_toolkit-3.0.34[${PYTHON_USEDEP}]
	dev-python/pygments[${PYTHON_USEDEP}]
"
BDEPEND=""

RESTRICT="test"

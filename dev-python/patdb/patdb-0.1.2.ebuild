# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=hatchling
PYTHON_COMPAT=( python3_{13..15} )

inherit distutils-r1

DESCRIPTION="A snappy + easy + pretty TUI debugger for Python"
HOMEPAGE="https://github.com/patrick-kidger/patdb"
SRC_URI="https://github.com/patrick-kidger/patdb/archive/refs/tags/v${PV}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	>=dev-python/click-8.1.7[${PYTHON_USEDEP}]
	>=dev-python/prompt-toolkit-3.0.46[${PYTHON_USEDEP}]
	>=dev-python/ptpython-3.0.27[${PYTHON_USEDEP}]
	>=dev-python/pygments-2.14.0[${PYTHON_USEDEP}]
	>=dev-python/seali-0.4.0[${PYTHON_USEDEP}]
	>=dev-python/typing-extensions-4.5.0[${PYTHON_USEDEP}]
	>=dev-python/wadler-lindig-0.1.0[${PYTHON_USEDEP}]
"

distutils_enable_tests pytest

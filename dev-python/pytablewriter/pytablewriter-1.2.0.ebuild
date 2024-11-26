# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{11..13} )

inherit distutils-r1

DESCRIPTION="A Python library to write a table in various formats"
HOMEPAGE="https://github.com/thombashi/pytablewriter"
SRC_URI="https://github.com/thombashi/pytablewriter/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	dev-python/xlwt[${PYTHON_USEDEP}]
	>=dev-python/xlsxwriter-0.9.6[${PYTHON_USEDEP}]
	>=dev-python/elasticsearch-8.0.1[${PYTHON_USEDEP}]
	>=dev-python/pytablereader-0.31.3[${PYTHON_USEDEP}]
	>=dev-python/dominate-2.1.5[${PYTHON_USEDEP}]
	>=dev-python/loguru-0.4.1[${PYTHON_USEDEP}]
	>=dev-python/simplesqlite-1.3.2[${PYTHON_USEDEP}]
	>=dev-python/pytablewriter-altrow-theme-0.2.0[${PYTHON_USEDEP}]
	>=dev-python/pytablewriter-altcol-theme-0.1.0[${PYTHON_USEDEP}]
	>=dev-python/toml-0.9.3[${PYTHON_USEDEP}]
	>=dev-python/pyyaml-3.11[${PYTHON_USEDEP}]
	>=dev-python/pandas-0.25.3[${PYTHON_USEDEP}]
"
#BDEPEND="
#	test? (
#	)
#"

distutils_enable_tests pytest

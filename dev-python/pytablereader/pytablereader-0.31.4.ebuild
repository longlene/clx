# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{11..13} )

inherit distutils-r1

DESCRIPTION="A Python library to load structured table data from files/strings/URL with various data format"
HOMEPAGE="https://github.com/thombashi/pytablereader"
SRC_URI="https://github.com/thombashi/pytablereader/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	>=dev-python/beautifulsoup4-4.5.3[${PYTHON_USEDEP}]
	>=dev-python/dataproperty-0.54.2[${PYTHON_USEDEP}]
	>=dev-python/jsonschema-2.5.1[${PYTHON_USEDEP}]
	>=dev-python/mbstrdecoder-1.0.0[${PYTHON_USEDEP}]
	>=dev-python/pathvalidate-2.5.2[${PYTHON_USEDEP}]
	>=dev-python/path-13[${PYTHON_USEDEP}]
	>=dev-python/tabledata-1.1.1[${PYTHON_USEDEP}]
	>=dev-python/typepy-1.2.0[${PYTHON_USEDEP}]
"
#BDEPEND="
#	test? (
#	)
#"

distutils_enable_tests pytest

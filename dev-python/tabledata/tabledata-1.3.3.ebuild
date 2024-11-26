# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{11..13} )

inherit distutils-r1

DESCRIPTION="tabledata is a Python library to represent tabular data"
HOMEPAGE="
	https://pypi.org/project/tabledata/
"
SRC_URI="https://github.com/thombashi/tabledata/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	>=dev-python/dataproperty-1.0.1[${PYTHON_USEDEP}]
	>=dev-python/typepy-1.2.0[${PYTHON_USEDEP}]
"
#BDEPEND="
#	test? (
#	)
#"

distutils_enable_tests pytest

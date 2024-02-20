# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_1{1..2} )

inherit distutils-r1

DESCRIPTION="A toolbar overlay for debugging Flask applications"
HOMEPAGE="https://github.com/pallets-eco/flask-debugtoolbar"
SRC_URI="https://github.com/pallets-eco/flask-debugtoolbar/archive/refs/tags/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD-3"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	dev-python/flask[${PYTHON_USEDEP}]
	dev-python/blinker[${PYTHON_USEDEP}]
	dev-python/itsdangerous[${PYTHON_USEDEP}]
	dev-python/werkzeug[${PYTHON_USEDEP}]
	dev-python/MarkupSafe[${PYTHON_USEDEP}]
	dev-python/packaging[${PYTHON_USEDEP}]
"
#BDEPEND="
#	test? (
#	)
#"

#distutils_enable_tests pytest

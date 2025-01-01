# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{11..13} )

inherit distutils-r1

DESCRIPTION="A lightweight Python web API framework"
HOMEPAGE="
	https://apiflask.com/
	https://github.com/apiflask/apiflask
	https://pypi.org/project/apiflask/
"
SRC_URI="https://github.com/apiflask/apiflask/archive/refs/tags/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	>=dev-python/flask-2[${PYTHON_USEDEP}]
	>=dev-python/flask-marshmallow-1.0.0[${PYTHON_USEDEP}]
	>=dev-python/marshmallow-3.20[${PYTHON_USEDEP}]
	>=dev-python/webargs-8.3[${PYTHON_USEDEP}]
	>=dev-python/flask-httpauth-4[${PYTHON_USEDEP}]
	>=dev-python/apispec-6[${PYTHON_USEDEP}]
"
#BDEPEND="
#	test? (
#	)
#"

distutils_enable_tests pytest

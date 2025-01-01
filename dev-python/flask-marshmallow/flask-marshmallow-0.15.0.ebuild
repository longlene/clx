# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=flit
PYTHON_COMPAT=( python3_{11..13} )

inherit distutils-r1 pypi

DESCRIPTION="Flask + marshmallow for beautiful APIs"
HOMEPAGE="
	https://github.com/marshmallow-code/flask-marshmallow/
	https://pypi.org/project/flask-marshmallow/
"
SRC_URI="https://github.com/marshmallow-code/flask-marshmallow/archive/refs/tags/${PV}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	>=dev-python/flask-2.2[${PYTHON_USEDEP}]
	>=dev-python/marshmallow-3.0.0[${PYTHON_USEDEP}]
"
BDEPEND="
	test? (
		dev-python/flask-marshmallow[${PYTHON_USEDEP}]
	)
"

distutils_enable_tests pytest

# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{11..12} )

inherit distutils-r1

DESCRIPTION="Flask App Builder"
HOMEPAGE="https://github.com/dpgaspar/Flask-AppBuilder"
SRC_URI="https://github.com/dpgaspar/Flask-AppBuilder/archive/refs/tags/v4.5.1.tar.gz -> ${P}.tar.gz"

LICENSE="BSD-3"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	>=dev-python/apispec-6.0.0[${PYTHON_USEDEP}]
	>=dev-python/colorama-0.3.9[${PYTHON_USEDEP}]
	>=dev-python/click-8.0.0[${PYTHON_USEDEP}]
	>=dev-python/email-validator-1.0.5[${PYTHON_USEDEP}]
	>=dev-python/flask-2.0.0[${PYTHON_USEDEP}]
	>=dev-python/flask-babel-1.0.0[${PYTHON_USEDEP}]
	>=dev-python/flask-limiter-3.0.0[${PYTHON_USEDEP}]
	>=dev-python/flask-login-0.3[${PYTHON_USEDEP}]
	>=dev-python/flask-sqlalchemy-2.4[${PYTHON_USEDEP}]
	>=dev-python/flask-wtf-0.14.2[${PYTHON_USEDEP}]
	>=dev-python/flask-jwt-extended-4.0.0[${PYTHON_USEDEP}]
	>=dev-python/jsonschema-3.18.0[${PYTHON_USEDEP}]
	>=dev-python/marshmallow-3.18.0[${PYTHON_USEDEP}]
	>=dev-python/marshmallow-sqlalchemy-0.22.0[${PYTHON_USEDEP}]
	>=dev-python/python-dateutil-2.3[${PYTHON_USEDEP}]
	>=dev-python/prison-0.2.1[${PYTHON_USEDEP}]
	>=dev-python/pyjwt-2.0.0[${PYTHON_USEDEP}]
	>=dev-python/sqlalchemy-1.5[${PYTHON_USEDEP}]
	>=dev-python/sqlalchemy-utils-0.32.21[${PYTHON_USEDEP}]
	dev-python/wtforms[${PYTHON_USEDEP}]
	dev-python/werkzeug[${PYTHON_USEDEP}]
"
#BDEPEND="
#	test? (
#	)
#"
#
#distutils_enable_tests pytest
RESTRICT="test"

S="${WORKDIR}"/Flask-AppBuilder-${PV}

# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=hatchling
PYTHON_COMPAT=( python3_{11..13} )

inherit distutils-r1

DESCRIPTION="Form rendering, validation, and CSRF protection for Flask with WTForms"
HOMEPAGE="https://github.com/wtforms/flask-wtf"
SRC_URI="https://github.com/wtforms/flask-wtf/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	dev-python/flask[${PYTHON_USEDEP}]
	dev-python/wtforms[${PYTHON_USEDEP}]
	dev-python/itsdangerous[${PYTHON_USEDEP}]
"
#BDEPEND="
#	test? (
#	)
#"
#
#distutils_enable_tests pytest
RESTRICT="test"

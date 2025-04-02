# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=hatchling
PYTHON_COMPAT=( python3_12 )

inherit distutils-r1 pypi

EGIT_COMMIT="8595fa8b5513a336c9c679829f49ddc20f56377d"

DESCRIPTION="Flask extension for integration with Pydantic library"
HOMEPAGE="
	https://pypi.org/project/flask-pydantic/
	https://github.com/bauerji/flask_pydantic
"
SRC_URI="https://github.com/bauerji/flask-pydantic/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	dev-python/flask[${PYTHON_USEDEP}]
	>=dev-python/pydantic-2.0[${PYTHON_USEDEP}]
"
#BDEPEND="
#	test? (
#	)
#"

distutils_enable_tests pytest

S="${WORKDIR}"/${PN}-${EGIT_COMMIT}

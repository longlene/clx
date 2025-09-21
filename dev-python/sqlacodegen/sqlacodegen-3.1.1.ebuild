# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{11..13} )

inherit distutils-r1

DESCRIPTION="Automatic model code generator for SQLAlchemy"
HOMEPAGE="
	https://pypi.org/project/sqlacodegen/
	https://github.com/agronholm/sqlacodegen
"
SRC_URI="https://github.com/agronholm/sqlacodegen/archive/refs/tags/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	>=dev-python/sqlalchemy-2.0.29[${PYTHON_USEDEP}]
	>=dev-python/inflect-4.0.0[${PYTHON_USEDEP}]
"
#BDEPEND="
#	test? (
#	)
#"

distutils_enable_tests pytest

export SETUPTOOLS_SCM_PRETEND_VERSION_FOR_${PN^^}=${PV}

# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{13..14} )

inherit distutils-r1

DESCRIPTION="Full-featured JSON type with mutation tracking for SQLAlchemy"
HOMEPAGE="
	https://pypi.org/project/sqlalchemy-json/
	https://github.com/edelooff/sqlalchemy-json/
"
SRC_URI="https://github.com/edelooff/sqlalchemy-json/archive/refs/tags/v${PV}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="BSD-2"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	>=dev-python/sqlalchemy-0.7.0[${PYTHON_USEDEP}]
"
#BDEPEND="
#	test? (
#	)
#"

EPYTEST_PLUGINS=()
distutils_enable_tests pytest

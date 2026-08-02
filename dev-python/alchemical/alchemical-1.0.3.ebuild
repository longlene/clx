# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{13..15} )

inherit distutils-r1

DESCRIPTION="Modern SQLAlchemy simplified"
HOMEPAGE="https://github.com/miguelgrinberg/alchemical"
SRC_URI="https://github.com/miguelgrinberg/alchemical/archive/refs/tags/v${PV}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
RESTRICT="test"

RDEPEND="
	>=dev-python/sqlalchemy-1.4.24[${PYTHON_USEDEP}]
"

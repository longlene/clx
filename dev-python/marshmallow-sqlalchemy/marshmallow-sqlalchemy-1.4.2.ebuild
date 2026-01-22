# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=flit
PYTHON_COMPAT=( python3_{11..14} )

inherit distutils-r1

DESCRIPTION="SQLAlchemy integration with the marshmallow (de)serialization library"
HOMEPAGE="https://github.com/marshmallow-code/marshmallow-sqlalchemy"
SRC_URI="https://github.com/marshmallow-code/marshmallow-sqlalchemy/archive/refs/tags/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~arm64 ~x86"
IUSE="test"

DEPEND=""
RDEPEND="
	${DEPEND}
	>=dev-python/marshmallow-3.18.0[${PYTHON_USEDEP}]
	>=dev-python/sqlalchemy-1.4.40[${PYTHON_USEDEP}]
"

RESTRICT="test"

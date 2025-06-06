# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7
PYTHON_COMPAT=( python3_{11..13} )

inherit distutils-r1

DESCRIPTION="SQLAlchemy integration with the marshmallow (de)serialization library"
HOMEPAGE="https://github.com/marshmallow-code/marshmallow-sqlalchemy"
SRC_URI="https://github.com/marshmallow-code/marshmallow-sqlalchemy/archive/refs/tags/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~arm64 ~x86"
IUSE="test"

RDEPEND="
	>=dev-python/marshmallow-2.15.2[${PYTHON_USEDEP}]
	>=dev-python/sqlalchemy-1.2.0[${PYTHON_USEDEP}]"
DEPEND="${RDEPEND}
	dev-python/setuptools[${PYTHON_USEDEP}]"

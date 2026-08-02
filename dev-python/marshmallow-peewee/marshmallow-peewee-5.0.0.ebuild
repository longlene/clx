# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=poetry-core
PYTHON_COMPAT=( python3_{13..15} )

inherit distutils-r1

DESCRIPTION="Peewee ORM integration with the marshmallow (de)serialization library"
HOMEPAGE="https://github.com/klen/marshmallow-peewee https://pypi.org/project/marshmallow-peewee/"
SRC_URI="https://github.com/klen/marshmallow-peewee/archive/refs/tags/${PV}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
RESTRICT="test"

RDEPEND="
	>=dev-python/marshmallow-3.0.0[${PYTHON_USEDEP}]
	>=dev-python/peewee-3.14.0[${PYTHON_USEDEP}]
"

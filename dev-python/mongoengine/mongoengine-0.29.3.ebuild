# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{13..15} )

inherit distutils-r1

DESCRIPTION="A Python Object-Document-Mapper for working with MongoDB"
HOMEPAGE="
	https://mongoengine-odm.readthedocs.io
	https://github.com/MongoEngine/mongoengine
"
SRC_URI="https://github.com/MongoEngine/mongoengine/archive/refs/tags/v${PV}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
RESTRICT="test"

RDEPEND="
	>=dev-python/pymongo-3.4[${PYTHON_USEDEP}]
	<dev-python/pymongo-5.0[${PYTHON_USEDEP}]
"

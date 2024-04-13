# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=flit
PYTHON_COMPAT=( python3_{11..12} )

inherit distutils-r1

DESCRIPTION="A Flask/Quart JSON provider using the fast orjson library"
HOMEPAGE="https://github.com/pallets-eco/flask-orjson/"
SRC_URI="https://github.com/pallets-eco/flask-orjson/archive/refs/tags/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE=""
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	dev-python/flask[${PYTHON_USEDEP}]
	dev-python/orjson[${PYTHON_USEDEP}]
"
BDEPEND=""

RESTRICT="test"

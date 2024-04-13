# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=flit
PYTHON_COMPAT=( python3_{11..12} )

inherit distutils-r1

DESCRIPTION="Class based views for Flask"
HOMEPAGE="https://github.com/pallets-eco/flask-classful"
SRC_URI="https://github.com/pallets-eco/flask-classful/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD-3"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	>=dev-python/flask-2.0[${PYTHON_USEDEP}]
"
BDEPEND=""

RESTRICT="test"

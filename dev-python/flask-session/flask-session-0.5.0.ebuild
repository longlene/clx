# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DISTUTILS_USE_PEP517=flit
PYTHON_COMPAT=( python3_{10..12} )

inherit distutils-r1

DESCRIPTION="Adds server-side session support to your Flask application"
HOMEPAGE="https://github.com/fengsp/flask-session"
SRC_URI="https://github.com/pallets-eco/flask-session/archive/refs/tags/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="test"

RDEPEND="
	>=dev-python/flask-2.2[${PYTHON_USEDEP}]
	dev-python/cachelib[${PYTHON_USEDEP}]
"
DEPEND="${RDEPEND}"

RESTRICT="test"

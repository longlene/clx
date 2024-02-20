# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{11..12} )

inherit distutils-r1

DESCRIPTION="WebSocket support for Flask"
HOMEPAGE="https://github.com/miguelgrinberg/flask-sock"
SRC_URI="https://github.com/miguelgrinberg/flask-sock/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	dev-python/flask[${PYTHON_USEDEP}]
	>=dev-python/simple-websocket-0.5.1[${PYTHON_USEDEP}]
"
BDEPEND=""

RESTRICT="test"

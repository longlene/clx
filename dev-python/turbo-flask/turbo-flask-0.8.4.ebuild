# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{11..12} )

inherit distutils-r1

DESCRIPTION="Integration of Hotwire's Turbo library with Flask"
HOMEPAGE="https://github.com/miguelgrinberg/turbo-flask"
SRC_URI="https://github.com/miguelgrinberg/turbo-flask/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	>=dev-python/flask-2.0.0[${PYTHON_USEDEP}]
	>=dev-python/flask-sock-0.4[${PYTHON_USEDEP}]
"
BDEPEND=""

RESTRICT=test

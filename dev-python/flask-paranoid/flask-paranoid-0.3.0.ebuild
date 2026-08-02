# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{13..15} )

inherit distutils-r1

DESCRIPTION="Simple user session protection for Flask"
HOMEPAGE="https://github.com/miguelgrinberg/flask-paranoid"
SRC_URI="https://github.com/miguelgrinberg/flask-paranoid/archive/refs/tags/v${PV}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
RESTRICT="test"

RDEPEND="
	>=dev-python/flask-0.10[${PYTHON_USEDEP}]
"

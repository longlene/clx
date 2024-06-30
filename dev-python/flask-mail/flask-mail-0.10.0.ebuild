# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=flit
PYTHON_COMPAT=( python3_{11..13} )

inherit distutils-r1

DESCRIPTION="Flask-Mail adds SMTP mail sending to your Flask applications"
HOMEPAGE="
	https://github.com/pallets-eco/flask-mail
	https://pypi.org/project/flask-mail/
"
SRC_URI="https://github.com/pallets-eco/flask-mail/archive/refs/tags/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD-3"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	dev-python/flask[${PYTHON_USEDEP}]
	dev-python/blinker[${PYTHON_USEDEP}]
"
BDEPEND=""

distutils_enable_tests pytest

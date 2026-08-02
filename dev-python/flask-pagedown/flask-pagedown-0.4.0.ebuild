# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{13..15} )

inherit distutils-r1

DESCRIPTION="PageDown markdown editor integration for Flask and Flask-WTF"
HOMEPAGE="https://github.com/miguelgrinberg/Flask-PageDown"
SRC_URI="https://github.com/miguelgrinberg/Flask-PageDown/archive/refs/tags/v${PV}.tar.gz -> ${P}.gh.tar.gz"

S="${WORKDIR}/Flask-PageDown-${PV}"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
RESTRICT="test"

RDEPEND="
	dev-python/flask[${PYTHON_USEDEP}]
	dev-python/wtforms[${PYTHON_USEDEP}]
"

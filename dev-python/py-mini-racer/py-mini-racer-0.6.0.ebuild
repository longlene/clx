# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{13..15} )

inherit distutils-r1 pypi

DESCRIPTION="Minimal, modern embedded V8 for Python"
HOMEPAGE="
	https://github.com/sqreen/PyMiniRacer
	https://pypi.org/project/py-mini-racer/
"

LICENSE="ISC"
SLOT="0"
KEYWORDS="~amd64"
RESTRICT="test"

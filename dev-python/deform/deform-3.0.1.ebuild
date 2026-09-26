# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{13..15} )

inherit distutils-r1

DESCRIPTION="A Python HTML form library"
HOMEPAGE="
	https://github.com/Pylons/deform
	https://pypi.org/project/deform/
"
SRC_URI="https://github.com/Pylons/deform/archive/refs/tags/${PV}.tar.gz
	-> ${P}.gh.tar.gz"

# Main code is BSD-2; static/ assets carry CC-BY-3.0.
LICENSE="BSD-2 CC-BY-3.0"
SLOT="0"
KEYWORDS="~amd64 ~arm64"
RESTRICT="test"

RDEPEND="
	${PYTHON_DEPS}
	>=dev-python/chameleon-2.5.1[${PYTHON_USEDEP}]
	>=dev-python/colander-1.0[${PYTHON_USEDEP}]
	dev-python/iso8601[${PYTHON_USEDEP}]
	>=dev-python/peppercorn-0.3[${PYTHON_USEDEP}]
	>=dev-python/translationstring-1.0[${PYTHON_USEDEP}]
	dev-python/zope-deprecation[${PYTHON_USEDEP}]
"

src_prepare() {
	default
	distutils-r1_src_prepare
}

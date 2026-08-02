# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{13..15} )

inherit distutils-r1

DESCRIPTION="Handlebars.js template support for Python"
HOMEPAGE="https://github.com/wbond/pybars3"
SRC_URI="https://github.com/wbond/pybars3/archive/refs/tags/${PV}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="LGPL-3"
SLOT="0"
KEYWORDS="~amd64"
RESTRICT="test"

RDEPEND="
	>=dev-python/pymeta3-0.5.1[${PYTHON_USEDEP}]
"

src_prepare() {
	sed -i 's/from distutils.core import setup/from setuptools import setup/' setup.py || die
	distutils-r1_src_prepare
}

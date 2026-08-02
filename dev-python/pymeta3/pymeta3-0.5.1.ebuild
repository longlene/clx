# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{13..15} )

inherit distutils-r1

DESCRIPTION="Pattern-matching language based on OMeta for Python 3"
HOMEPAGE="https://github.com/wbond/pymeta3 https://pypi.org/project/PyMeta3/"
SRC_URI="https://github.com/wbond/pymeta3/archive/refs/tags/${PV}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
RESTRICT="test"

src_prepare() {
	sed -i 's/from distutils.core import setup/from setuptools import setup/' setup.py || die
	distutils-r1_src_prepare
}

# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{13..15} )
DISTUTILS_USE_PEP517=setuptools
COMMIT="fb0642baeb467c6449679c4f7f9ecd7622543f22"

inherit distutils-r1

DESCRIPTION="JSON-LD processor written in Python"
HOMEPAGE="https://github.com/neodb-social/pyld"
SRC_URI="https://github.com/neodb-social/pyld/archive/${COMMIT}.tar.gz -> ${P}.gh.tar.gz"
S="${WORKDIR}/pyld-${COMMIT}"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	dev-python/cachetools[${PYTHON_USEDEP}]
	dev-python/frozendict[${PYTHON_USEDEP}]
	dev-python/lxml[${PYTHON_USEDEP}]
"
BDEPEND="dev-python/setuptools[${PYTHON_USEDEP}]"

RESTRICT="test"

src_prepare() {
	sed -i 's/from distutils.core import setup/from setuptools import setup/' setup.py || die
	distutils-r1_src_prepare
}

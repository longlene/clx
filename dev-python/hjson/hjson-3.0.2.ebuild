# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{10,11} )
inherit distutils-r1

DESCRIPTION="Hjson for Python"
HOMEPAGE="https://hjson.github.io/"
SRC_URI="https://github.com/hjson/hjson-py/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND=""
BDEPEND=""

RESTRICT="test"

S="${WORKDIR}"/hjson-py-${PV}

src_prepare() {
	default
	sed -e "/packages=/{s#, 'hjson.tests'##}" \
		-i setup.py
	distutils-r1_src_prepare
}

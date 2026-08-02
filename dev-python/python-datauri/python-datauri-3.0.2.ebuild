# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{13..15} )

inherit distutils-r1

DESCRIPTION="A li'l class for data URI manipulation in Python"
HOMEPAGE="https://github.com/fcurella/python-datauri"
SRC_URI="https://github.com/fcurella/python-datauri/archive/refs/tags/v${PV}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="Unlicense"
SLOT="0"
KEYWORDS="~amd64"

PATCHES=( "${FILESDIR}/${P}-functools-cached-property.patch" )

EPYTEST_PLUGINS=()
distutils_enable_tests pytest

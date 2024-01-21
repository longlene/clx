# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_1{1..2} )

#inherit distutils-r1 pypi
inherit distutils-r1

DESCRIPTION="A Python binding for the great C library raylib"
HOMEPAGE="https://github.com/overdev/raylib-py"
SRC_URI="https://github.com/overdev/raylib-py/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	dev-games/raylib
"
BDEPEND=""

S="${WORKDIR}"/${P}

# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=hatchling
PYTHON_COMPAT=( python3_1{1..2} )

inherit distutils-r1 pypi

DESCRIPTION="Chinese Numerals To Arabic Numerals"
HOMEPAGE="https://github.com/Ailln/cn2an/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND=""
BDEPEND=""

RESTRICT=test

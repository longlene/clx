# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_EXT=1
DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{11..13} )

inherit distutils-r1

DESCRIPTION="A fast serialization and validation library"
HOMEPAGE="https://jcristharif.com/msgspec"
SRC_URI="https://github.com/jcrist/msgspec/archive/refs/tags/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD-3"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND=""
BDEPEND="
	test? (
		dev-python/msgpack[${PYTHON_USEDEP}]
	)
"

distutils_enable_tests pytest

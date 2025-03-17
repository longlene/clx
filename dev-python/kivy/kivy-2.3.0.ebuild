# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
DISTUTILS_EXT=1
PYTHON_COMPAT=( python3_{11..13} )

inherit distutils-r1

DESCRIPTION="Open source UI framework written in Python"
HOMEPAGE="
	https://kivy.org/
	https://github.com/kivy/kivy
"
SRC_URI="https://github.com/kivy/kivy/archive/refs/tags/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	>=dev-python/cython-0.29.1[${PYTHON_USEDEP}]
"
BDEPEND=""

distutils_enable_tests pytest

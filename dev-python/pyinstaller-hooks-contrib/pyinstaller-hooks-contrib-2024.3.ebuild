# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{11..12} )

inherit distutils-r1

DESCRIPTION="Community maintained hooks for PyInstaller"
HOMEPAGE="https://github.com/pyinstaller/pyinstaller-hooks-contrib"
SRC_URI="https://github.com/pyinstaller/pyinstaller-hooks-contrib/archive/refs/tags/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="|| ( Apache-2.0 GPL-2 )"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
"
BDEPEND="
	>=dev-python/packaging-22.0[${PYTHON_USEDEP}]
"

distutils_enable_tests pytest

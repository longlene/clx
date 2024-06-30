# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{11..13} )

inherit distutils-r1

DESCRIPTION="Cross-Platform module to get info on and control windows on screen"
HOMEPAGE="https://github.com/Kalmat/PyWinCtl"
SRC_URI="https://github.com/Kalmat/PyWinCtl/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD-3"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	>=dev-python/python-xlib-0.21[${PYTHON_USEDEP}]
	>=dev-python/ewmhlib-0.2[${PYTHON_USEDEP}]
	>=dev-python/typing_extensions-4.4.0[${PYTHON_USEDEP}]
	>=dev-python/pywinbox-0.7[${PYTHON_USEDEP}]
	>=dev-python/pymonctl-0.92[${PYTHON_USEDEP}]
"
#BDEPEND="
#	test? (
#	)
#"
#
#distutils_enable_tests pytest
RESTRICT="test"

# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12..13} )

inherit distutils-r1

EGIT_COMMIT="b4255d0be42c377154c7d92337d7f8515fc63234"

DESCRIPTION="A cross-platform GUI automation Python module for human beings"
HOMEPAGE="
	https://github.com/asweigart/pyautogui
	https://pypi.org/project/pyautogui/
"
SRC_URI="https://github.com/asweigart/pyautogui/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD-3"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	dev-python/python-xlib[${PYTHON_USEDEP}]
	dev-python/pymsgbox[${PYTHON_USEDEP}]
	>=dev-python/pytweening-1.0.4[${PYTHON_USEDEP}]
	>=dev-python/pyscreeze-0.1.21[${PYTHON_USEDEP}]
	>=dev-python/pygetwindow-0.0.5[${PYTHON_USEDEP}]
	dev-python/mouseinfo[${PYTHON_USEDEP}]
"
#BDEPEND="
#	test? (
#	)
#"
#
#distutils_enable_tests pytest
RESTRICT="test"

S="${WORKDIR}"/${PN}-${EGIT_COMMIT}

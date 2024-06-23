# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{11..13} )

inherit distutils-r1

EGIT_COMMIT="23791fad3347efef405e1bbe65809a6394b1677d"

DESCRIPTION="An application to display XY position and RGB color information for the pixel currently under the mouse"
HOMEPAGE="https://github.com/asweigart/mouseinfo"
SRC_URI="https://github.com/asweigart/mouseinfo/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	dev-python/python-xlib[${PYTHON_USEDEP}]
	dev-python/pyperclip[${PYTHON_USEDEP}]
	>=dev-python/pillow-6.2.1[${PYTHON_USEDEP}]
"
#BDEPEND="
#	test? (
#	)
#"
#
#distutils_enable_tests pytest
RESTRICT="test"

S="${WORKDIR}"/${PN}-${EGIT_COMMIT}

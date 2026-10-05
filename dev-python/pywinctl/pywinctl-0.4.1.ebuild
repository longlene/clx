# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{13..15} )

inherit distutils-r1

# upstream tags 0.4.01 (== 0.4.1 in PEP 440; Portage compares "01" < "1")
MY_PV=0.4.01

DESCRIPTION="Cross-platform toolkit to get info on and control windows on screen"
HOMEPAGE="
	https://github.com/Kalmat/PyWinCtl
	https://pypi.org/project/PyWinCtl/
"
SRC_URI="https://github.com/Kalmat/PyWinCtl/archive/refs/tags/v${MY_PV}.tar.gz -> ${PN}-${MY_PV}.gh.tar.gz"
S="${WORKDIR}/PyWinCtl-${MY_PV}"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64"
# tests need a running X display with a window manager
RESTRICT="test"

RDEPEND="
	>=dev-python/ewmhlib-0.2[${PYTHON_USEDEP}]
	>=dev-python/pymonctl-0.92[${PYTHON_USEDEP}]
	>=dev-python/python-xlib-0.21[${PYTHON_USEDEP}]
	>=dev-python/pywinbox-0.7[${PYTHON_USEDEP}]
	>=dev-python/typing-extensions-4.4.0[${PYTHON_USEDEP}]
"

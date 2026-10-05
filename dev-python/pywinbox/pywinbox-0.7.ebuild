# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{13..15} )

inherit distutils-r1

DESCRIPTION="Cross-platform, multi-monitor toolkit to handle window and area boxes"
HOMEPAGE="
	https://github.com/Kalmat/PyWinBox
	https://pypi.org/project/pywinbox/
"
SRC_URI="https://github.com/Kalmat/PyWinBox/archive/refs/tags/v${PV}.tar.gz -> ${P}.gh.tar.gz"
S="${WORKDIR}/PyWinBox-${PV}"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64"
# tests need a running X display with a window manager
RESTRICT="test"

RDEPEND="
	>=dev-python/ewmhlib-0.1[${PYTHON_USEDEP}]
	>=dev-python/python-xlib-0.21[${PYTHON_USEDEP}]
	>=dev-python/typing-extensions-4.4.0[${PYTHON_USEDEP}]
"

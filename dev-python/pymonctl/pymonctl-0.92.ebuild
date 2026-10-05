# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{13..15} )

inherit distutils-r1

DESCRIPTION="Cross-platform toolkit to get info on and control connected monitors"
HOMEPAGE="
	https://github.com/Kalmat/PyMonCtl
	https://pypi.org/project/pymonctl/
"
SRC_URI="https://github.com/Kalmat/PyMonCtl/archive/refs/tags/v${PV}.tar.gz -> ${P}.gh.tar.gz"
S="${WORKDIR}/PyMonCtl-${PV}"

LICENSE="BSD HPND"
SLOT="0"
KEYWORDS="~amd64"
# tests need a running X display with a window manager
RESTRICT="test"

RDEPEND="
	>=dev-python/ewmhlib-0.2[${PYTHON_USEDEP}]
	>=dev-python/python-xlib-0.21[${PYTHON_USEDEP}]
	>=dev-python/typing-extensions-4.4.0[${PYTHON_USEDEP}]
"

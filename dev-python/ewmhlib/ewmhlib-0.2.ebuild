# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{13..15} )

inherit distutils-r1

DESCRIPTION="Extended Window Manager Hints (EWMH) implementation for X11"
HOMEPAGE="
	https://github.com/Kalmat/EWMHlib
	https://pypi.org/project/ewmhlib/
"
SRC_URI="https://github.com/Kalmat/EWMHlib/archive/refs/tags/v${PV}.tar.gz -> ${P}.gh.tar.gz"
S="${WORKDIR}/EWMHlib-${PV}"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64"
# tests need a running X display with a window manager
RESTRICT="test"

RDEPEND="
	>=dev-python/python-xlib-0.21[${PYTHON_USEDEP}]
	>=dev-python/typing-extensions-4.4.0[${PYTHON_USEDEP}]
"

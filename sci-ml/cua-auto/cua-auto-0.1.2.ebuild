# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=hatchling
PYTHON_COMPAT=( python3_{13..15} )

inherit distutils-r1 pypi

DESCRIPTION="Cross-platform desktop automation (mouse, keyboard, windows) for Cua"
HOMEPAGE="
	https://github.com/trycua/cua
	https://pypi.org/project/cua-auto/
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	>=dev-python/pillow-10.0.0[${PYTHON_USEDEP}]
	>=dev-python/pynput-1.7.0[${PYTHON_USEDEP}]
	>=dev-python/pyperclip-1.9.0[${PYTHON_USEDEP}]
	>=dev-python/pywinctl-0.4[${PYTHON_USEDEP}]
"

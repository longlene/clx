# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=hatchling
PYTHON_COMPAT=( python3_{12..14} )

inherit distutils-r1 pypi

DESCRIPTION="System package manager interfaces with Python type hints"
HOMEPAGE="https://github.com/ArchiveBox/abxpkg https://pypi.org/project/abxpkg/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm64"
IUSE="abxbus pyinfra rich"
RESTRICT="test"

RDEPEND="
	>=dev-python/platformdirs-4.9.2[${PYTHON_USEDEP}]
	>=dev-python/pydantic-2.12.5[${PYTHON_USEDEP}]
	>=dev-python/rich-click-1.9.7[${PYTHON_USEDEP}]
	>=dev-python/typing-extensions-4.15.0[${PYTHON_USEDEP}]
	abxbus? ( >=dev-python/abxbus-2.5.9[${PYTHON_USEDEP}] )
	pyinfra? ( >=dev-python/pyinfra-3.6.1[${PYTHON_USEDEP}] )
	rich? ( >=dev-python/rich-14.0.0[${PYTHON_USEDEP}] )
"

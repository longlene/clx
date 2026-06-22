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
KEYWORDS="~amd64"
IUSE="abxbus pyinfra rich"
RESTRICT="test"

RDEPEND="
	$(python_gen_cond_dep '
		dev-python/pip[${PYTHON_USEDEP}]
		dev-python/typing-extensions[${PYTHON_USEDEP}]
		dev-python/platformdirs[${PYTHON_USEDEP}]
		>=dev-python/pydantic-2.12.5[${PYTHON_USEDEP}]
		dev-python/rich-click[${PYTHON_USEDEP}]
		abxbus? ( >=dev-python/abxbus-2.5.9[${PYTHON_USEDEP}] )
		pyinfra? ( >=dev-python/pyinfra-3.6.1[${PYTHON_USEDEP}] )
		rich? ( >=dev-python/rich-14.0.0[${PYTHON_USEDEP}] )
	')
"

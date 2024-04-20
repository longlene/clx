# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{11..12} )

inherit distutils-r1

DESCRIPTION="A little Python library for making simple Electron-like HTML/JS GUI apps"
HOMEPAGE="https://github.com/python-eel/Eel"
SRC_URI="https://github.com/python-eel/Eel/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	dev-python/bottle[${PYTHON_USEDEP}]
	dev-python/bottle-websocket[${PYTHON_USEDEP}]
	dev-python/future[${PYTHON_USEDEP}]
	dev-python/pyparsing[${PYTHON_USEDEP}]
	dev-python/whichcraft[${PYTHON_USEDEP}]
"
BDEPEND="
	test? (
		>=dev-python/psutil-5.9.2[${PYTHON_USEDEP}]
		>=dev-python/pytest-timeouot-2.1.0[${PYTHON_USEDEP}]
		>=dev-python/selenium-3.141.0[${PYTHON_USEDEP}]
		>=dev-python/webdriver_manager-3.7.1[${PYTHON_USEDEP}]
		>=dev-python/mypy-0.971[${PYTHON_USEDEP}]
		>=dev-python/pyinstaller-4.10[${PYTHON_USEDEP}]
		>=dev-python/types-setuptools-67.2.0.1[${PYTHON_USEDEP}]
	)
"

distutils_enable_tests pytest

S="${WORKDIR}"/Eel-${PV}

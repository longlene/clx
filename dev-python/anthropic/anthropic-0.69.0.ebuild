# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=hatchling
PYTHON_COMPAT=( python3_{13..14} )

inherit distutils-r1

DESCRIPTION="The official Python library for the anthropic API"
HOMEPAGE="
	https://pypi.org/project/anthropic/
	https://github.com/anthropics/anthropic-sdk-python
"
SRC_URI="https://github.com/anthropics/anthropic-sdk-python/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	>=dev-python/httpx-0.25.0[${PYTHON_USEDEP}]
	>=dev-python/pydantic-1.9.0[${PYTHON_USEDEP}]
	>=dev-python/typing-extensions-4.10.0[${PYTHON_USEDEP}]
	>=dev-python/anyio-3.5.0[${PYTHON_USEDEP}]
	>=dev-python/distro-1.7.0[${PYTHON_USEDEP}]
	dev-python/sniffio[${PYTHON_USEDEP}]
	>=dev-python/jiter-0.4.0[${PYTHON_USEDEP}]
	>=dev-python/docstring-parser-0.15[${PYTHON_USEDEP}]
"
BDEPEND="
	dev-python/hatch-fancy-pypi-readme[${PYTHON_USEDEP}]
	test? (
		dev-python/pytest-asyncio[${PYTHON_USEDEP}]
		>=dev-python/pytest-xdist-3.6.1[${PYTHON_USEDEP}]
	)
"

EPYTEST_PLUGINS=()
distutils_enable_tests pytest

S="${WORKDIR}"/${PN}-sdk-python-${PV}

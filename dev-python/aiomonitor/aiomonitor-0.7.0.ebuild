# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{11..13} )

inherit distutils-r1

DESCRIPTION=""
HOMEPAGE="
	https://pypi.org/project/aiomonitor/
"
SRC_URI="https://github.com/aio-libs/aiomonitor/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	>=dev-python/attrs-20[${PYTHON_USEDEP}]
	>=dev-python/aiohttp-3.8.5[${PYTHON_USEDEP}]
	>=dev-python/click-8.0[${PYTHON_USEDEP}]
	>=dev-python/janus-1.0[${PYTHON_USEDEP}]
	>=dev-python/jinja2-3.1.2[${PYTHON_USEDEP}]
	dev-python/terminaltables[${PYTHON_USEDEP}]
	>=dev-python/trafaret-2.1.1[${PYTHON_USEDEP}]
	>=dev-python/typing-extensions-4.1[${PYTHON_USEDEP}]
	>=dev-python/prompt_toolkit-3.0[${PYTHON_USEDEP}]
	>=dev-python/aioconsole-0.7.0[${PYTHON_USEDEP}]
"
#BDEPEND="
#	test? (
#	)
#"

distutils_enable_tests pytest

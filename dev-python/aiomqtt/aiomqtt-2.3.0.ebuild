# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=hatchling
PYTHON_COMPAT=( python3_{11..13} )

inherit distutils-r1

DESCRIPTION="The idiomatic asyncio MQTT client, wrapped around paho-mqtt"
HOMEPAGE="https://github.com/sbtinstruments/aiomqtt"
SRC_URI="https://github.com/sbtinstruments/aiomqtt/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD-3"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	>=dev-python/paho-mqtt-2.0.0[${PYTHON_USEDEP}]
"
BDEPEND="
	test? (
		>=dev-python/mypy-1.9.0[${PYTHON_USEDEP}]
		>=dev-python/ruff-0.1.9[${PYTHON_USEDEP}]
		>=dev-python/pytest-7.3.1[${PYTHON_USEDEP}]
		>=dev-python/pytest-cov-4.0.0[${PYTHON_USEDEP}]
		>=dev-python/anyio-3.6.2[${PYTHON_USEDEP}]
		>=dev-python/furo-2023.3.27[${PYTHON_USEDEP}]
		>=dev-python/sphinx-autobuild-2021.3.14[${PYTHON_USEDEP}]
		>=dev-python/myst-parser-1.0.0[${PYTHON_USEDEP}]
		>=dev-python/sphinx-copybutton-0.5.2[${PYTHON_USEDEP}]
		>=dev-python/sphinx-5.3[${PYTHON_USEDEP}]
	)
"

distutils_enable_tests pytest

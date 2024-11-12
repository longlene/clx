# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12..13} )

inherit distutils-r1

DESCRIPTION="A web server and web framework that's written to go fast"
HOMEPAGE="http://github.com/sanic-org/sanic/"
SRC_URI="https://github.com/sanic-org/sanic/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	>=dev-python/sanic-routing-23.12.0[${PYTHON_USEDEP}]
	>=dev-python/httptools-0.0.10[${PYTHON_USEDEP}]
	dev-python/uvloop[${PYTHON_USEDEP}]
	dev-python/ujson[${PYTHON_USEDEP}]
	>=dev-python/aiofiles-0.6.0[${PYTHON_USEDEP}]
	>=dev-python/websockets-10.0[${PYTHON_USEDEP}]
	>=dev-python/multidict-5.0[${PYTHON_USEDEP}]
	>=dev-python/html5tagger-1.2.1[${PYTHON_USEDEP}]
	>=dev-python/tracerite-1.0.0[${PYTHON_USEDEP}]
	>=dev-python/typing-extensions-4.4.0[${PYTHON_USEDEP}]
	>=dev-python/setuptools-70.1.0[${PYTHON_USEDEP}]
"
BDEPEND="
	test? (
		dev-python/pytest-sanic[${PYTHON_USEDEP}]
	)
"

distutils_enable_tests pytest

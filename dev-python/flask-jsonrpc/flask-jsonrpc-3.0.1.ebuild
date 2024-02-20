# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_1{1..2} )

inherit distutils-r1

DESCRIPTION="Basic JSON-RPC implementation for your Flask-powered sites"
HOMEPAGE="https://github.com/cenobites/flask-jsonrpc"
SRC_URI="https://github.com/cenobites/flask-jsonrpc/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD-3"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	>=dev-python/flask-3.0.0[${PYTHON_USEDEP}]
	>=dev-python/typeguard-2.13.3[${PYTHON_USEDEP}]
	>=dev-python/typing_extensions-4.3.0[${PYTHON_USEDEP}]
	>=dev-python/typing_inspect-0.9.0[${PYTHON_USEDEP}]
"
#BDEPEND="
#	test? (
#	)
#"

#distutils_enable_tests pytest
RESTRICT="test"

# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{11..14} )

inherit distutils-r1 pypi

DESCRIPTION="Django ASGI (HTTP/WebSocket) server"
HOMEPAGE="https://github.com/django/daphne https://pypi.org/project/daphne/"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64"
RESTRICT="test"

RDEPEND="$(python_gen_cond_dep '
	>=dev-python/asgiref-3.5.2[${PYTHON_USEDEP}]
	>=dev-python/autobahn-22.4.2[${PYTHON_USEDEP}]
	>=dev-python/twisted-22.4[ssl,${PYTHON_USEDEP}]
')"

# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{13..15} )
PYPI_NO_NORMALIZE=1

inherit distutils-r1 pypi

DESCRIPTION="Websocket handler for the gevent pywsgi server"
HOMEPAGE="https://gitlab.com/noppo/gevent-websocket https://pypi.org/project/gevent-websocket/"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"
RESTRICT="test"

RDEPEND="$(python_gen_cond_dep '
	dev-python/gevent[${PYTHON_USEDEP}]
')"

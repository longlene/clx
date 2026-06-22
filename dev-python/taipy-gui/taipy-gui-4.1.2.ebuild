# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{13..15} )

inherit distutils-r1 pypi

DESCRIPTION="Low-code library for building Python web GUIs"
HOMEPAGE="https://github.com/Avaiga/taipy https://pypi.org/project/taipy-gui/"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"
IUSE="arrow image ngrok"
RESTRICT="test"

RDEPEND="$(python_gen_cond_dep '
	dev-python/charset-normalizer[${PYTHON_USEDEP}]
	>=dev-python/flask-3.1.0[${PYTHON_USEDEP}]
	dev-python/flask-cors[${PYTHON_USEDEP}]
	dev-python/flask-socketio[${PYTHON_USEDEP}]
	dev-python/gevent[${PYTHON_USEDEP}]
	dev-python/gevent-websocket[${PYTHON_USEDEP}]
	dev-python/gitignore-parser[${PYTHON_USEDEP}]
	dev-python/kthread[${PYTHON_USEDEP}]
	dev-python/markdown[${PYTHON_USEDEP}]
	dev-python/pandas[${PYTHON_USEDEP}]
	dev-python/python-dotenv[${PYTHON_USEDEP}]
	dev-python/pytz[${PYTHON_USEDEP}]
	dev-python/simple-websocket[${PYTHON_USEDEP}]
	dev-python/taipy-common[${PYTHON_USEDEP}]
	dev-python/twisted[${PYTHON_USEDEP}]
	dev-python/tzlocal[${PYTHON_USEDEP}]
	dev-python/watchdog[${PYTHON_USEDEP}]
	arrow? ( dev-python/pyarrow[${PYTHON_USEDEP}] )
	image? ( dev-python/python-magic[${PYTHON_USEDEP}] )
	ngrok? ( dev-python/pyngrok[${PYTHON_USEDEP}] )
')"

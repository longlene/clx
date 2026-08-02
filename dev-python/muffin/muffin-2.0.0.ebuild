# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=hatchling
PYTHON_COMPAT=( python3_{13..15} )

inherit distutils-r1

DESCRIPTION="Fast, simple and asyncronous web-framework for Python 3"
HOMEPAGE="https://github.com/klen/muffin https://pypi.org/project/muffin/"
SRC_URI="https://github.com/klen/muffin/archive/refs/tags/${PV}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE="standard"
RESTRICT="test"

RDEPEND="
	dev-python/asgi-tools[${PYTHON_USEDEP}]
	dev-python/modconfig[${PYTHON_USEDEP}]
	dev-python/orjson
	standard? (
		www-servers/gunicorn[${PYTHON_USEDEP}]
		dev-python/uvicorn[${PYTHON_USEDEP}]
	)
"

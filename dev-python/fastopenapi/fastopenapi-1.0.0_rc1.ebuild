# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=poetry
PYTHON_COMPAT=( python3_{13..15} )

inherit distutils-r1

DESCRIPTION="OpenAPI schema generation with Pydantic v2 and multiple web frameworks"
HOMEPAGE="https://fastopenapi.fatalyst.dev/ https://github.com/mr-fatalyst/fastopenapi"
SRC_URI="https://github.com/mr-fatalyst/fastopenapi/archive/refs/tags/v${PV/_rc/rc}.tar.gz -> ${P}.gh.tar.gz"
S="${WORKDIR}/${PN}-${PV/_rc/rc}"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE="aiohttp django falcon flask quart sanic starlette tornado"
RESTRICT="test"

RDEPEND="
	>=dev-python/pydantic-2.10.6[${PYTHON_USEDEP}]
	aiohttp? ( >=dev-python/aiohttp-3.11.0[${PYTHON_USEDEP}] )
	django? ( >=dev-python/django-5.2[${PYTHON_USEDEP}] )
	falcon? ( >=dev-python/falcon-4.0.2[${PYTHON_USEDEP}] )
	flask? ( >=dev-python/flask-3.1.0[${PYTHON_USEDEP}] )
	quart? ( >=dev-python/quart-0.20.0[${PYTHON_USEDEP}] )
	sanic? ( >=dev-python/sanic-24.12.0[${PYTHON_USEDEP}] )
	starlette? ( >=dev-python/starlette-0.46.0[${PYTHON_USEDEP}] )
	tornado? ( >=dev-python/tornado-6.4.0[${PYTHON_USEDEP}] )
"

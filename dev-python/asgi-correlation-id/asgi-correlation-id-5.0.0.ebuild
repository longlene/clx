# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=uv-build
PYTHON_COMPAT=( python3_{13..15} )

inherit distutils-r1 pypi

DESCRIPTION="Middleware correlating project logs to individual requests"
HOMEPAGE="https://github.com/snok/asgi-correlation-id https://pypi.org/project/asgi-correlation-id/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE="sentry"
RESTRICT="test"

RDEPEND="$(python_gen_cond_dep '
	>=dev-python/starlette-0.18[${PYTHON_USEDEP}]
	sentry? ( >=dev-python/sentry-sdk-2.12.0[${PYTHON_USEDEP}] )
')"

# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=hatchling
PYTHON_COMPAT=( python3_{13..15} )

inherit distutils-r1 pypi

DESCRIPTION="Lightweight ASGI framework and toolkit for building async web applications"
HOMEPAGE="
	https://github.com/dymmond/lilya
	https://lilya.dev
	https://pypi.org/project/lilya/
"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64"
IUSE="jinja2 sessions"
RESTRICT="test"

RDEPEND="
	$(python_gen_cond_dep '
		>=dev-python/anyio-3.4.0[${PYTHON_USEDEP}]
		>=dev-python/multidict-6.0.4[${PYTHON_USEDEP}]
		dev-python/monkay[${PYTHON_USEDEP}]
		jinja2? ( >=dev-python/jinja2-3.1.3[${PYTHON_USEDEP}] )
		sessions? ( >=dev-python/itsdangerous-2.2.0[${PYTHON_USEDEP}] )
	')
"

# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{13..15} )

inherit distutils-r1

DESCRIPTION="Build realtime web, mobile and desktop apps in Python"
HOMEPAGE="https://flet.dev https://github.com/flet-dev/flet"
SRC_URI="https://github.com/flet-dev/flet/archive/refs/tags/v${PV}.tar.gz -> ${P}.gh.tar.gz"

S="${WORKDIR}/flet-${PV}/sdk/python/packages/flet"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"
IUSE="web"

RDEPEND="
	$(python_gen_cond_dep '
		>=dev-python/httpx-0.28.1[${PYTHON_USEDEP}]
		>=dev-python/msgpack-1.1.0[${PYTHON_USEDEP}]
		>=dev-python/oauthlib-3.2.2[${PYTHON_USEDEP}]
		>=dev-python/repath-0.9.0[${PYTHON_USEDEP}]
		web? (
			>=dev-python/fastapi-0.115.12[${PYTHON_USEDEP}]
			>=dev-python/uvicorn-0.35.0[${PYTHON_USEDEP}]
		)
	')
"
BDEPEND="
	$(python_gen_cond_dep '
		dev-python/setuptools[${PYTHON_USEDEP}]
	')
"

RESTRICT="test"

python_prepare_all() {
	# pyproject.toml has placeholder version "0.1.0"; set the real version
	sed -i "s/^version = \"0.1.0\"/version = \"${PV}\"/" pyproject.toml || die
	distutils-r1_python_prepare_all
}

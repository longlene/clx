# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=uv-build
PYTHON_COMPAT=( python3_{13..15} )

inherit distutils-r1

DESCRIPTION="A next-generation Python notebook"
HOMEPAGE="https://marimo.io/"
SRC_URI="https://github.com/marimo-team/marimo/archive/${PV}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	$(python_gen_cond_dep '
		>=dev-python/click-8.0[${PYTHON_USEDEP}]
		>=dev-python/docutils-0.16.0[${PYTHON_USEDEP}]
		>=dev-python/itsdangerous-2.0.0[${PYTHON_USEDEP}]
		>=dev-python/jedi-0.18.0[${PYTHON_USEDEP}]
		>=dev-python/loro-1.10.0[${PYTHON_USEDEP}]
		>=dev-python/markdown-3.6[${PYTHON_USEDEP}]
		>=dev-python/msgspec-0.20.0[${PYTHON_USEDEP}]
		>=dev-python/narwhals-2.0.0[${PYTHON_USEDEP}]
		dev-python/packaging[${PYTHON_USEDEP}]
		>=dev-python/psutil-5.0[${PYTHON_USEDEP}]
		>=dev-python/pygments-2.19[${PYTHON_USEDEP}]
		>=dev-python/pymdown-extensions-10.21.2[${PYTHON_USEDEP}]
		>=dev-python/python-multipart-0.0.18[${PYTHON_USEDEP}]
		>=dev-python/pyyaml-6.0.1[${PYTHON_USEDEP}]
		>=dev-python/pyzmq-27.1.0[${PYTHON_USEDEP}]
		>=dev-python/starlette-0.37.2[${PYTHON_USEDEP}]
		>=dev-python/tomlkit-0.12.0[${PYTHON_USEDEP}]
		>=dev-python/uvicorn-0.22.0[${PYTHON_USEDEP}]
		>=dev-python/websockets-14.2.0[${PYTHON_USEDEP}]
	')
"

BDEPEND="
	$(python_gen_cond_dep '
		>=dev-python/uv-build-0.8.3[${PYTHON_USEDEP}]
	')
"

RESTRICT="test"

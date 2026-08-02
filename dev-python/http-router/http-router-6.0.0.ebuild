# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_EXT=1
DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{13..15} )

inherit distutils-r1 pypi

DESCRIPTION="A simple router system for HTTP applications"
HOMEPAGE="https://github.com/klen/http-router https://pypi.org/project/http-router/"

S="${WORKDIR}/http_router-${PV}"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
RESTRICT="test"

BDEPEND="
	dev-python/cython[${PYTHON_USEDEP}]
"

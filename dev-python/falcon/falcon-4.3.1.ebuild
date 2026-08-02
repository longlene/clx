# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_EXT=1
DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{13..15} )

inherit distutils-r1

DESCRIPTION="Ultra-reliable, fast ASGI+WSGI framework for data plane APIs"
HOMEPAGE="https://falconframework.org/ https://github.com/falconry/falcon"
SRC_URI="https://github.com/falconry/falcon/archive/refs/tags/${PV}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"
RESTRICT="test"

BDEPEND="
	>=dev-python/cython-3.0.8[${PYTHON_USEDEP}]
"

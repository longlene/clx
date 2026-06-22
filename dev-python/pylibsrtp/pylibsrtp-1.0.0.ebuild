# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{13..15} )

inherit distutils-r1

DESCRIPTION="Python bindings for libsrtp"
HOMEPAGE="https://github.com/aiortc/pylibsrtp"
SRC_URI="https://github.com/aiortc/pylibsrtp/archive/refs/tags/${PV}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64"

DEPEND="net-libs/libsrtp"
RDEPEND="
	net-libs/libsrtp
	$(python_gen_cond_dep '
		>=dev-python/cffi-1.0.0[${PYTHON_USEDEP}]
	')
"
BDEPEND="
	$(python_gen_cond_dep '
		>=dev-python/cffi-1.0.0[${PYTHON_USEDEP}]
	')
"

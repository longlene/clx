# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{13..15} )

inherit distutils-r1

DESCRIPTION="Authentication classes to be used with httpx"
HOMEPAGE="https://github.com/Colin-b/httpx_auth"
SRC_URI="https://github.com/Colin-b/httpx_auth/archive/refs/tags/v${PV}.tar.gz -> ${P}.gh.tar.gz"

S="${WORKDIR}/httpx_auth-${PV}"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
RESTRICT="test"

RDEPEND="
	>=dev-python/httpx-0.28.0[${PYTHON_USEDEP}]
"

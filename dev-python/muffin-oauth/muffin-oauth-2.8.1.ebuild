# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=poetry-core
PYTHON_COMPAT=( python3_{13..15} )

inherit distutils-r1

DESCRIPTION="OAuth1/2 support for Muffin framework"
HOMEPAGE="https://github.com/klen/muffin-oauth"
SRC_URI="https://github.com/klen/muffin-oauth/archive/refs/tags/${PV}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	>=dev-python/aioauth-client-1.0[${PYTHON_USEDEP}]
	>=dev-python/muffin-1.0[${PYTHON_USEDEP}]
"

distutils_enable_tests pytest

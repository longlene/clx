# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=poetry
PYTHON_COMPAT=( python3_{13..15} )

inherit distutils-r1

DESCRIPTION="OAuth support for Asyncio/Trio libraries"
HOMEPAGE="https://github.com/klen/aioauth-client"
SRC_URI="https://github.com/klen/aioauth-client/archive/refs/tags/${PV}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
RESTRICT="test"

RDEPEND="
	dev-python/httpx2[${PYTHON_USEDEP}]
"

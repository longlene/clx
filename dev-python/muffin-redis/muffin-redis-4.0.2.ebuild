# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=uv-build
PYTHON_COMPAT=( python3_{13..15} )

inherit distutils-r1

DESCRIPTION="Redis support for Muffin framework"
HOMEPAGE="https://github.com/klen/muffin-redis"
SRC_URI="https://github.com/klen/muffin-redis/archive/refs/tags/${PV}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	dev-python/muffin[${PYTHON_USEDEP}]
	dev-python/redis[${PYTHON_USEDEP}]
"
DEPEND="${RDEPEND}"
BDEPEND=""

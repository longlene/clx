# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{13..15} )

inherit distutils-r1

DESCRIPTION="A fast and reliable background task processing library"
HOMEPAGE="
	https://github.com/Bogdanp/dramatiq
	https://pypi.org/project/dramatiq/
"
SRC_URI="https://github.com/Bogdanp/dramatiq/archive/refs/tags/v${PV}.tar.gz
	-> ${P}.gh.tar.gz"

LICENSE="LGPL-3+"
SLOT="0"
KEYWORDS="~amd64 ~arm64"
RESTRICT="test"

# The core library has no required runtime dependencies; broker
# backends (redis, rabbitmq, memcached, gevent, ...) are extras.
RDEPEND="
	${PYTHON_DEPS}
"

src_prepare() {
	default
	distutils-r1_src_prepare
}

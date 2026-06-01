# Copyright 2023 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{11..14}  )
inherit distutils-r1

DESCRIPTION="Redis-based components for Scrapy"
HOMEPAGE="https://github.com/rmax/scrapy-redis"
SRC_URI="https://github.com/rmax/scrapy-redis/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND="
	dev-python/redis-py
	dev-python/scrapy
	dev-python/six
"
RDEPEND="${DEPEND}"

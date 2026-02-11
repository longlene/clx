# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake

DESCRIPTION="Redis client written in C++"
HOMEPAGE="https://github.com/sewenew/redis-plus-plus"
SRC_URI="https://github.com/sewenew/redis-plus-plus/archive/refs/tags/${PV}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND="dev-libs/hiredis"
RDEPEND="${DEPEND}"
BDEPEND=""

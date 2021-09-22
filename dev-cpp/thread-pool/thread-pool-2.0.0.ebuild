# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="A C++17 thread pool for high-performance scientific computing"
HOMEPAGE="https://github.com/bshoshany/thread-pool"
SRC_URI="https://github.com/bshoshany/thread-pool/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

src_compile() {
	:
}

src_install() {
	insinto /usr/include
	doins thread_pool.hpp
	dodoc README.md
}

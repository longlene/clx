# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake vcs-snapshot

EGIT_COMMIT="b8374f80e42010941bda6c85b0e3f1a1bd77a1e0"

DESCRIPTION="Portable (POSIX/Windows/Emscripten) thread pool for C/C++"
HOMEPAGE="https://github.com/Maratyszcza/pthreadpool"
SRC_URI="https://github.com/Maratyszcza/pthreadpool/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

src_configure() {
	local mycmakeargs=(
	-DPTHREADPOOL_LIBRARY_TYPE=shared
	-DPTHREADPOOL_BUILD_TESTS=OFF
	-DPTHREADPOOL_BUILD_BENCHMARKS=OFF
	)
	cmake_src_configure
}

src_install() {
	dolib.so ${BUILD_DIR}/lib${PN}.so
	insinto /usr/include
	doins include/pthreadpool.h
	dodoc README.md
}

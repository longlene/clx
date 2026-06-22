# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

MY_COMMIT="5a71a5238fcdd4fe0e7410009c873bda3f40a392"

inherit cmake

DESCRIPTION="Lightweight user-space threading library for x86_64 and ARM64"
HOMEPAGE="https://github.com/NVIDIA/libuthread"
SRC_URI="https://github.com/NVIDIA/libuthread/archive/${MY_COMMIT}.tar.gz -> ${P}.gh.tar.gz"

S="${WORKDIR}/libuthread-${MY_COMMIT}"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

src_prepare() {
	# gcc -print-multiarch returns empty on musl; fall back to CMAKE_SYSTEM_PROCESSOR
	eapply "${FILESDIR}/${P}-cmake-processor-fallback.patch"
	cmake_src_prepare
}

src_configure() {
	local mycmakeargs=(
		# Upstream has no ctest integration; test binary is built but never run
		-DNVUT_BUILD_TESTS=OFF
	)
	cmake_src_configure
}

src_install() {
	doheader include/uthread.h
	dolib.a "${BUILD_DIR}/libuthread.a"
	einstalldocs
}

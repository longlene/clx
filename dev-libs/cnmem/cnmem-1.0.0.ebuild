# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake

DESCRIPTION="Simple memory manager for CUDA designed to help Deep Learning frameworks"
HOMEPAGE="https://github.com/NVIDIA/cnmem"
SRC_URI="https://github.com/NVIDIA/cnmem/archive/refs/tags/v${PV}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64"
RESTRICT="test"

DEPEND="dev-util/nvidia-cuda-toolkit"
RDEPEND="${DEPEND}"

src_prepare() {
	sed -i 's|LIBRARY DESTINATION lib|LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}|' CMakeLists.txt || die
	cmake_src_prepare
}

src_configure() {
	local mycmakeargs=(
		-DWITH_TESTS=OFF
		-DCMAKE_INSTALL_LIBDIR="$(get_libdir)"
	)
	cmake_src_configure
}

src_install() {
	cmake_src_install
	doheader include/cnmem.h
}

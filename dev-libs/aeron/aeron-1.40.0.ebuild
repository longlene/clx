# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake

DESCRIPTION="Efficient reliable UDP unicast, UDP multicast, and IPC message transport"
HOMEPAGE="https://github.com/real-logic/aeron"
SRC_URI="https://github.com/real-logic/aeron/archive/refs/tags/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

src_prepare() {
	default
	sed -e "s#DESTINATION lib#DESTINATION $(get_libdir)#" \
		-i aeron-client/src/main/c/CMakeLists.txt
	sed -e "s#DESTINATION lib#DESTINATION $(get_libdir)#" \
		-i aeron-driver/src/main/c/CMakeLists.txt
	sed -e "s#DESTINATION lib#DESTINATION $(get_libdir)#" \
		-i aeron-client/src/main/cpp/CMakeLists.txt
	cmake_src_prepare
}

src_configure() {
	local mycmakeargs=(
		-DBUILD_AERON_ARCHIVE_API=OFF
		-DAERON_TESTS=OFF
		-DAERON_SYSTEM_TESTS=OFF
		-DAERON_BUILD_SAMPLES=OFF
	)
	cmake_src_configure
}

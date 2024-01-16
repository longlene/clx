# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake

DESCRIPTION="A Simple, Light-Weight Asynchronous C++ Framework"
HOMEPAGE="https://github.com/alibaba/async_simple"
SRC_URI="https://github.com/alibaba/async_simple/archive/refs/tags/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

DEPEND="
	dev-libs/libaio
"
RDEPEND="${DEPEND}"
BDEPEND=""

src_prepare() {
	default
	sed -i "s#DESTINATION lib#DESTINATION $(get_libdir)#" async_simple/CMakeLists.txt
	cmake_src_prepare
}

src_configure() {
	local mycmakeargs=(
		-DASYNC_SIMPLE_ENABLE_TESTS=OFF
		-DASYNC_SIMPLE_BUILD_DEMO_EXAMPLE=OFF
	)
	cmake_src_configure
}

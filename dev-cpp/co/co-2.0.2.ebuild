# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake

DESCRIPTION="A go-style coroutine library in C++11 and more"
HOMEPAGE="https://github.com/idealvin/co"
SRC_URI="https://github.com/idealvin/co/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND="
	net-misc/curl
	dev-libs/openssl
"
RDEPEND="${DEPEND}"
BDEPEND=""

src_prepare() {
	default
	sed -i "/DESTINATION/{s#DESTINATION lib#DESTINATION $(get_libdir)#}" src/CMakeLists.txt
	cmake_src_prepare
}

src_configure() {
	local mycmakeargs=(
		-DWITH_LIBCURL=ON
		-DWITH_OPENSSL=ON
		-DFPIC=ON
		-DBUILD_ALL=OFF
	)
	cmake_src_configure
}

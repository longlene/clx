# Copyright 1999-2022 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cmake

DESCRIPTION="C++ Requests: Curl for People"
HOMEPAGE="https://github.com/libcpr/cpr"
SRC_URI="https://github.com/libcpr/cpr/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE="test"

DEPEND="
	test? ( dev-cpp/gtest )
"
RDEPEND="${DEPEND}"

src_configure() {
	local mycmakeargs=(
		-DUSE_SYSTEM_CURL=ON
		$(cmake_use_build test CPR_TESTS)
		$(cmake_use_use test SYSTEM_GTEST)
	)
	cmake_src_configure
}

src_install() {
	dolib.a ${BUILD_DIR}/lib/libcpr.a
	insinto /usr/include
	doins include/*.h
	insinto /usr/share/cmake/Modules
	doins cpr-config.cmake
	dodoc README.md
}

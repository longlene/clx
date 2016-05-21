# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

inherit cmake-utils

DESCRIPTION="C++ Requests: Curl for People"
HOMEPAGE="https://github.com/whoshuu/cpr"
SRC_URI="https://github.com/whoshuu/cpr/archive/${PV}.tar.gz -> ${P}.tar.gz"

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
	$(cmake-utils_use_build test CPR_TESTS)
	$(cmake-utils_use_use test SYSTEM_GTEST)
	)
	cmake-utils_src_configure
}

src_install() {
	dolib.a ${BUILD_DIR}/lib/libcpr.a
	insinto /usr/include
	doins include/*.h
	insinto /usr/share/cmake/Modules
	doins cpr-config.cmake
	dodoc README.md
}

# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cmake

DESCRIPTION="A header only library for creating and validating json web tokens in c++"
HOMEPAGE="https://github.com/Thalhammer/jwt-cpp"
SRC_URI="https://github.com/Thalhammer/jwt-cpp/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

src_prepare() {
	default
	sed -i "/set(JWT_CMAKE_FILES_INSTALL_DIR/{s#cmake#$(get_libdir)/cmake#}" CMakeLists.txt
	cmake_src_prepare
}

src_configure() {
	local mycmakeargs=(
		-DJWT_BUILD_EXAMPLES=OFF
	)
	cmake_src_configure
}

# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake

DESCRIPTION="C++ promise/A+ library in Javascript style"
HOMEPAGE="https://github.com/xhawk18/promise-cpp"
SRC_URI="https://github.com/xhawk18/promise-cpp/archive/refs/tags/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

src_configure() {
	local mycmakeargs=(
		-DPROMISE_BUILD_SHARED=ON
		-DPROMISE_BUILD_EXAMPLES=OFF
	)
	cmake_src_configure
}

src_install() {
	insinto /usr/include
	doins -r include/promise-cpp
	dolib.so "${BUILD_DIR}"/libpromise.so
	dodoc Readme.md
}

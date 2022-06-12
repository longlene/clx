# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake vcs-snapshot

EGIT_COMMIT="1acf15efedf527f0b1f00893b762bdee702d96cb"

DESCRIPTION="A Simple, Light-Weight Asynchronous C++ Framework"
HOMEPAGE="https://github.com/alibaba/async_simple"
SRC_URI="https://github.com/alibaba/async_simple/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

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
	)
	cmake_src_configure
}

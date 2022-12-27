# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake

DESCRIPTION="An open source project that includes YUV scaling and conversion functionality"
HOMEPAGE="https://chromium.googlesource.com/libyuv/libyuv"
SRC_URI="https://chromium.googlesource.com/libyuv/libyuv/+archive/3abd6f36b6e4f5a2e0ce236580a8bc1da3c7cf7e.tar.gz -> ${P}.tar.gz"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

S="${WORKDIR}"

src_prepare() {
	default
	sed -e "/INSTALL/{s#DESTINATION lib#DESTINATION $(get_libdir)#}" \
		-i CMakeLists.txt
	cmake_src_prepare
}

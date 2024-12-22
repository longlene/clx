# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake

EGIT_COMMIT="e01109dd9bddb8809d03dd38da1fdea539a8f244"

DESCRIPTION="An open source project that includes YUV scaling and conversion functionality"
HOMEPAGE="https://chromium.googlesource.com/libyuv/libyuv"
SRC_URI="https://chromium.googlesource.com/libyuv/libyuv/+archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

S="${WORKDIR}"

src_prepare() {
	default
	sed -e "/install/{s#DESTINATION lib#DESTINATION $(get_libdir)#g}" \
		-i CMakeLists.txt
	cmake_src_prepare
}

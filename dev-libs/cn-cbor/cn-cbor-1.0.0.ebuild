# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake

DESCRIPTION="A constrained node implementation of CBOR in C"
HOMEPAGE="https://github.com/jimsch/cn-cbor"
SRC_URI="https://github.com/jimsch/cn-cbor/archive/refs/tags/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

CMAKE_BUILD_TYPE=Debug

src_prepare() {
	default
	sed -e "/DESTINATION/{s#lib#$(get_libdir)#}" \
		-e '/install(FILES LICENSE/d' \
		-e "/set(libdir/{s#/lib#/$(get_libdir)#}" \
		-i CMakeLists.txt
	cmake_src_prepare
}

#src_configure() {
#	local mycmakeargs=(
#		-DCN_CBOR_COVERALLS=OFF
#		-DCN_CBOR_BUILD_TESTS=OFF
#	)
#	cmake_src_configure
#}

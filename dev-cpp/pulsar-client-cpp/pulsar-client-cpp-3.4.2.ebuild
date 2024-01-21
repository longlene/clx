# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake

DESCRIPTION="Apache Pulsar C++ client library"
HOMEPAGE="https://pulsar.apache.org/"
SRC_URI="https://github.com/apache/pulsar-client-cpp/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

src_prepare() {
	default
	sed -e "s#DESTINATION lib#DESTINATION $(get_libdir)#g" \
		-i lib/CMakeLists.txt
	cmake_src_prepare
}

src_configure() {
	local mycmakeargs=(
		-DBUILD_TESTS=OFF
	)
	cmake_src_configure
}

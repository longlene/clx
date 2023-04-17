# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake vcs-snapshot

DESCRIPTION="Cross-platform, efficient, customizable, and robust asynchronous HTTP/WebSocket server C++14 library"
HOMEPAGE="https://github.com/Stiffstream/restinio"
SRC_URI="https://github.com/Stiffstream/restinio/archive/refs/tags/v.${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD-3"
SLOT="0"
KEYWORDS="~amd64"

DEPEND="
	dev-cpp/expected-lite
	dev-cpp/optional-lite
	dev-cpp/string-view--lite
	dev-cpp/variant-lite
	dev-libs/boost
	dev-libs/libfmt
	net-libs/http-parser
"
RDEPEND="${DEPEND}"
BDEPEND=""

CMAKE_USE_DIR="${S}"/dev

src_configure() {
	local mycmakeargs=(
		-DRESTINIO_TEST=OFF
		-DRESTINIO_SAMPLE=OFF
		-DRESTINIO_INSTALL_SAMPLES=OFF
		-DRESTINIO_BENCH=OFF
		-DRESTINIO_INSTALL_BENCHES=OFF
		-DRESTINIO_FIND_DEPS=ON
		-DRESTINIO_USE_EXTERNAL_SOBJECTIZER=ON
		-DRESTINIO_USE_EXTERNAL_HTTP_PARSER=ON
		-DRESTINIO_USE_EXTERNAL_EXPECTED_LITE=ON
		-DRESTINIO_USE_EXTERNAL_OPTIONAL_LITE=ON
		-DRESTINIO_USE_EXTERNAL_STRING_VIEW_LITE=ON
		-DRESTINIO_USE_EXTERNAL_VARIANT_LITE=ON
		-DRESTINIO_USE_BOOST_ASIO=shared
	)
	cmake_src_configure
}

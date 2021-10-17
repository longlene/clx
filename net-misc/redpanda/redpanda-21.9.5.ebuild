# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cmake flag-o-matic

DESCRIPTION=""
HOMEPAGE=""
SRC_URI="
	https://github.com/vectorizedio/redpanda/archive/v${PV}.tar.gz -> ${P}.tar.gz
	https://github.com/aklomp/base64/archive/refs/tags/v0.4.0.tar.gz -> base64-0.4.0.tar.gz
"

LICENSE=""
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="ccache"

DEPEND="
	app-arch/snappy
	app-arch/zstd
	dev-cpp/abseil-cpp
	dev-cpp/seastar
	dev-libs/rapidjson
	dev-libs/xxhash
	dev-python/jinja
	net-misc/curl
	dev-libs/crc32c
	dev-libs/croaring
	dev-libs/hdr-histogram-c
	dev-python/pex
	dev-python/jinja
	dev-python/jsonschema
	ccache? ( dev-util/ccache )
"
RDEPEND="${DEPEND}"
BDEPEND=""

CMAKE_BUILD_TYPE=Release
CMAKE_IN_SOURCE_BUILD=ON

src_prepare() {
	default
	mkdir -p deps_install/{bin,include,lib}
	emake -C "${WORKDIR}"/base64-0.4.0
	cp "${WORKDIR}"/base64-0.4.0/lib/libbase64.o deps_install/lib
	cp "${WORKDIR}"/base64-0.4.0/include/libbase64.h deps_install/include
	sed -i '/add_subdirectory/{/tests/d}' src/v/kafka/CMakeLists.txt
	sed -i '/add_subdirectory/{/tests/d}' src/v/kafka/protocol/CMakeLists.txt
	sed -i '/add_subdirectory/{/tests/d}' src/v/ssx/CMakeLists.txt
	sed -i '/add_subdirectory/{/tests/d}' src/v/hashing/CMakeLists.txt
	sed -i '/add_subdirectory/{/tests/d}' src/v/utils/CMakeLists.txt
	sed -i '/add_subdirectory/{/tests/d}' src/v/cluster/CMakeLists.txt
	sed -i '/add_subdirectory/{/tests/d}' src/v/bytes/CMakeLists.txt
	sed -i '/add_subdirectory/{/tests/d}' src/v/compression/CMakeLists.txt
	sed -i '/add_subdirectory/{/test/d}' src/v/serde/CMakeLists.txt
	sed -i '/add_subdirectory/{/test/d}' src/v/rpc/CMakeLists.txt
	sed -i 's#kafka-codegen-venv#python3#' src/v/kafka/protocol/schemata/CMakeLists.txt
	cmake_src_prepare
}

src_configure() {
	local mycmakeargs=(
		-DREDPANDA_DEPS_SKIP_BUILD=ON
		-DWITH_CCACHE=$(usex ccache)
		-DRP_ENABLE_TESTS=OFF
	)
	cmake_src_configure
}

src_compile() {
	cmake_src_compile
}

# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake

DESCRIPTION="A modern replacement for Redis and Memcached"
HOMEPAGE="https://www.dragonflydb.io/ https://github.com/dragonflydb/dragonfly"

HELIO_COMMIT="f438e794012676af47c042ae96dc845e40a8ff7f"
RAPIDJSON_COMMIT="ab1842a2dae061284c0a62dca1cc6d5e7e37e346"
EXPECTED_COMMIT="f17940fabae07063cabb67abf2c8d164d3146044"
DCONV_COMMIT="0604b4c18815aadcf7f4b78dfa6bfcb91a634ed7"
HDR_COMMIT="652d51bcc36744fd1a6debfeb1a8a5f58b14022c"
LUA_COMMIT="0c33948bc087853b6b5b4290fe01d03d8f3d276c"
JSONCONS_COMMIT="bfe69f2b3fda0e38b677d7bb6ec8310dc3b3d200"
HNSWLIB_COMMIT="d07dd1da2bf48b85d2f03b8396193ad7120f75c2"

SRC_URI="
	https://github.com/dragonflydb/dragonfly/archive/refs/tags/v${PV}.tar.gz
		-> ${P}.gh.tar.gz
	https://github.com/romange/helio/archive/${HELIO_COMMIT}.tar.gz
		-> helio-${HELIO_COMMIT:0:8}.gh.tar.gz
	https://github.com/abseil/abseil-cpp/releases/download/20250512.1/abseil-cpp-20250512.1.tar.gz
	https://github.com/google/googletest/archive/v1.17.0.tar.gz
		-> googletest-1.17.0.gh.tar.gz
	https://github.com/google/benchmark/archive/v1.9.5.tar.gz
		-> benchmark-1.9.5.gh.tar.gz
	https://github.com/Cyan4973/xxHash/archive/v0.8.3.tar.gz
		-> xxhash-0.8.3.gh.tar.gz
	https://github.com/axboe/liburing/archive/refs/tags/liburing-2.13.tar.gz
		-> liburing-2.13.gh.tar.gz
	https://github.com/zeux/pugixml/archive/refs/tags/v1.15.tar.gz
		-> pugixml-1.15.gh.tar.gz
	https://codeload.github.com/c-ares/c-ares/tar.gz/refs/tags/v1.34.5
		-> c-ares-1.34.5.tar.gz
	https://github.com/facebook/zstd/releases/download/v1.5.7/zstd-1.5.7.tar.zst
	https://github.com/Tencent/rapidjson/archive/${RAPIDJSON_COMMIT}.tar.gz
		-> rapidjson-${RAPIDJSON_COMMIT:0:8}.gh.tar.gz
	https://github.com/martinmoene/expected-lite/archive/${EXPECTED_COMMIT}.tar.gz
		-> expected-lite-${EXPECTED_COMMIT:0:8}.gh.tar.gz
	https://github.com/dragonflydb/lua/archive/${LUA_COMMIT}.tar.gz
		-> lua-${LUA_COMMIT:0:8}.gh.tar.gz
	https://github.com/google/double-conversion/archive/${DCONV_COMMIT}.tar.gz
		-> double-conversion-${DCONV_COMMIT:0:8}.gh.tar.gz
	https://github.com/Genivia/RE-flex/archive/refs/tags/v5.2.2.tar.gz
		-> RE-flex-5.2.2.gh.tar.gz
	https://github.com/dragonflydb/jsoncons/archive/${JSONCONS_COMMIT}.tar.gz
		-> jsoncons-${JSONCONS_COMMIT:0:8}.gh.tar.gz
	https://github.com/lz4/lz4/archive/refs/tags/v1.10.0.tar.gz
		-> lz4-1.10.0.gh.tar.gz
	https://github.com/microsoft/mimalloc/archive/refs/tags/v2.2.4.tar.gz
		-> mimalloc-2.2.4.gh.tar.gz
	https://github.com/mariusbancila/croncpp/archive/refs/tags/v2023.03.30.tar.gz
		-> croncpp-2023.03.30.gh.tar.gz
	https://github.com/fastfloat/fast_float/archive/refs/tags/v5.2.0.tar.gz
		-> fast_float-5.2.0.gh.tar.gz
	https://github.com/google/flatbuffers/archive/refs/tags/v23.5.26.tar.gz
		-> flatbuffers-23.5.26.gh.tar.gz
	https://github.com/HdrHistogram/HdrHistogram_c/archive/${HDR_COMMIT}.tar.gz
		-> HdrHistogram_c-${HDR_COMMIT:0:8}.gh.tar.gz
	search? (
		https://github.com/uni-algo/uni-algo/archive/refs/tags/v1.0.0.tar.gz
			-> uni-algo-1.0.0.gh.tar.gz
		https://github.com/dragonflydb/hnswlib/archive/${HNSWLIB_COMMIT}.tar.gz
			-> hnswlib-${HNSWLIB_COMMIT:0:8}.gh.tar.gz
		https://github.com/snowballstem/snowball/archive/refs/tags/v3.0.1.tar.gz
			-> snowball-3.0.1.gh.tar.gz
	)
"

LICENSE="BUSL-1.1"
SLOT="0"
KEYWORDS="~amd64"
IUSE="search ssl"

DEPEND="
	dev-libs/boost:=[context(+)]
	ssl? ( dev-libs/openssl:= )
"
RDEPEND="${DEPEND}"
BDEPEND="
	dev-build/autoconf
	dev-build/automake
	sys-devel/bison
"

src_prepare() {
	# Populate the helio submodule; the GitHub archive includes helio/ as an
	# empty gitlink placeholder, so remove it first to prevent mv from nesting.
	rm -rf "${S}/helio" || die
	mv "${WORKDIR}/helio-${HELIO_COMMIT}" "${S}/helio" || die

	cmake_src_prepare

	# Pre-apply abseil patches (FetchContent PATCH_COMMAND is skipped when
	# FETCHCONTENT_SOURCE_DIR_ABSEIL_CPP overrides the source directory).
	# The release tarball already includes the inlined_vector.h hunk from
	# abseil-20250512.1.patch; apply only the symbolize.h part via sed.
	pushd "${WORKDIR}/abseil-cpp-20250512.1" || die
	sed -i 's/ && defined(__GLIBC__)//' \
		absl/debugging/internal/symbolize.h || die
	eapply "${S}/helio/patches/abseil-gcc-undefined-sanitizer-compilation-fix.patch"
	popd || die

	# helio unconditionally adds its examples/ subdirectory; raw_echo_server
	# links TRDP::gperf and calls ProfilerEnable() which is undefined when
	# WITH_GPERF=OFF.  Remove the examples entirely — they are not needed.
	sed -i '/^add_subdirectory(examples)/d' "${S}/helio/CMakeLists.txt" || die

	# Patch cmake files to use pre-downloaded sources instead of network downloads.
	# ExternalProject_Add and FetchContent both try to download at configure/build
	# time; replace each https:// URL with the corresponding distfile path.
	python3 "${FILESDIR}/patch-cmake-sources.py" \
		"${S}/helio/cmake/third_party.cmake" \
		"${S}/src/external_libs.cmake" \
		"${DISTDIR}" \
		"${RAPIDJSON_COMMIT}" \
		"${EXPECTED_COMMIT}" \
		"${DCONV_COMMIT}" \
		"${HDR_COMMIT}" \
		"${LUA_COMMIT}" \
		"${JSONCONS_COMMIT}" || die "cmake source patching failed"
}

src_configure() {
	# Copy gtest tarball to CMAKE_BINARY_DIR before cmake runs: helio's cmake checks
	# if(NOT EXISTS "${CMAKE_BINARY_DIR}/googletest-${GTEST_VERSION}.tar.gz")
	# and tries to download if missing.  The cmake eclass sets BUILD_DIR=${S}_build
	# inside cmake_src_configure, so compute the path here.
	local cmake_binary_dir="${S}_build"
	mkdir -p "${cmake_binary_dir}" || die
	cp "${DISTDIR}/googletest-1.17.0.gh.tar.gz" \
		"${cmake_binary_dir}/googletest-1.17.0.tar.gz" || die

	local mycmakeargs=(
		# Dragonfly's internal libraries have circular deps; keep them static.
		-DBUILD_SHARED_LIBS=OFF
		# Disable git version metadata (avoids git subprocess calls)
		-DENABLE_GIT_VERSION=OFF
		# Disable optional features that pull extra git-sourced deps
		-DLEGACY_GLOG=OFF
		-DWITH_AWS=OFF
		-DWITH_GCP=OFF
		-DWITH_GPERF=OFF
		-DWITH_UNWIND=OFF
		# Pre-populated FetchContent source directories
		-DFETCHCONTENT_SOURCE_DIR_GTEST="${WORKDIR}/googletest-1.17.0"
		-DFETCHCONTENT_SOURCE_DIR_BENCHMARK="${WORKDIR}/benchmark-1.9.5"
		-DFETCHCONTENT_SOURCE_DIR_ABSEIL_CPP="${WORKDIR}/abseil-cpp-20250512.1"
		# SSL support
		-DDF_USE_SSL=$(usex ssl ON OFF)
		# Search module
		-DWITH_SEARCH=$(usex search ON OFF)
		-DBUILD_TESTING=OFF
	)
	cmake_src_configure
}

src_compile() {
	# Build only the dragonfly binary; test executables link against optional
	# libraries (dfly::search, AWS SDK) that may not be available.
	cmake_build dragonfly
}

src_install() {
	dobin "${BUILD_DIR}/dragonfly"
	einstalldocs
}

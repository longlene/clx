# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake

COMMIT="22fca04564c7cc230fd8b9523b8b92864e1dad47"
ARROW_COMMIT="b7d2f7ffca66c868bd2fce5b3749c6caa002a7f0"
CLICKHOUSE_CPP_COMMIT="ba9027200d26b812ce513c17a9364b143ece9450"
FMT_COMMIT="8fe893c0ac54c83a08c2492a7ac790c1a2bdd577"
FOLLY_COMMIT="1b7cd10340f565d7fa3fd4f78d6faf14605d77b2"
GOOGLETEST_COMMIT="8d51dc50eb7e7698427fed81b85edad0e032112e"
GTEST_PARALLEL_COMMIT="96f4f904922f9bf66689e749c40f314845baaac8"
JEMALLOC_COMMIT="f96010b7fa8ce5f83802144bdebf2bb7a6679649"
LEVELDB_COMMIT="aa5479bbf47e9df86e0afbb89e6246085f22cdd4"
LIBURING_COMMIT="298c083d75ecde5a8833366167b3b6abff0c8d39"
MIMALLOC_COMMIT="43ce4bd7fd34bcc730c1c7471c99995597415488"
PYBIND11_COMMIT="aa304c9c7d725ffb9d10af08a3b34cb372307020"
ROCKSDB_COMMIT="7c0838e65e7db1dd10b7a8411553c04f2d89fa61"
SCNLIB_COMMIT="eac40e8e7fcaf73f06ea2ffb8a1aaf34f90994f4"
TOML11_COMMIT="86eefc7255f2c70c5b0fc26525d349796032e99e"
ZSTD_COMMIT="63779c798237346c2b245c546c40b72a5a5913fe"

DESCRIPTION="High-performance distributed file system for AI infrastructure"
HOMEPAGE="https://github.com/deepseek-ai/3FS"
SRC_URI="
	https://github.com/deepseek-ai/3FS/archive/${COMMIT}.tar.gz
		-> ${P}.gh.tar.gz
	https://github.com/apache/arrow/archive/${ARROW_COMMIT}.tar.gz
		-> deepseek-3fs-arrow-${ARROW_COMMIT}.gh.tar.gz
	https://github.com/ClickHouse/clickhouse-cpp/archive/${CLICKHOUSE_CPP_COMMIT}.tar.gz
		-> deepseek-3fs-clickhouse-cpp-${CLICKHOUSE_CPP_COMMIT}.gh.tar.gz
	https://github.com/fmtlib/fmt/archive/${FMT_COMMIT}.tar.gz
		-> deepseek-3fs-fmt-${FMT_COMMIT}.gh.tar.gz
	https://github.com/facebook/folly/archive/${FOLLY_COMMIT}.tar.gz
		-> deepseek-3fs-folly-${FOLLY_COMMIT}.gh.tar.gz
	https://github.com/google/googletest/archive/${GOOGLETEST_COMMIT}.tar.gz
		-> deepseek-3fs-googletest-${GOOGLETEST_COMMIT}.gh.tar.gz
	https://github.com/google/gtest-parallel/archive/${GTEST_PARALLEL_COMMIT}.tar.gz
		-> deepseek-3fs-gtest-parallel-${GTEST_PARALLEL_COMMIT}.gh.tar.gz
	https://github.com/jemalloc/jemalloc/archive/${JEMALLOC_COMMIT}.tar.gz
		-> deepseek-3fs-jemalloc-${JEMALLOC_COMMIT}.gh.tar.gz
	https://github.com/google/leveldb/archive/${LEVELDB_COMMIT}.tar.gz
		-> deepseek-3fs-leveldb-${LEVELDB_COMMIT}.gh.tar.gz
	https://github.com/axboe/liburing/archive/${LIBURING_COMMIT}.tar.gz
		-> deepseek-3fs-liburing-${LIBURING_COMMIT}.gh.tar.gz
	https://github.com/microsoft/mimalloc/archive/${MIMALLOC_COMMIT}.tar.gz
		-> deepseek-3fs-mimalloc-${MIMALLOC_COMMIT}.gh.tar.gz
	https://github.com/pybind/pybind11/archive/${PYBIND11_COMMIT}.tar.gz
		-> deepseek-3fs-pybind11-${PYBIND11_COMMIT}.gh.tar.gz
	https://github.com/facebook/rocksdb/archive/${ROCKSDB_COMMIT}.tar.gz
		-> deepseek-3fs-rocksdb-${ROCKSDB_COMMIT}.gh.tar.gz
	https://github.com/eliaskosunen/scnlib/archive/${SCNLIB_COMMIT}.tar.gz
		-> deepseek-3fs-scnlib-${SCNLIB_COMMIT}.gh.tar.gz
	https://github.com/ToruNiina/toml11/archive/${TOML11_COMMIT}.tar.gz
		-> deepseek-3fs-toml11-${TOML11_COMMIT}.gh.tar.gz
	https://github.com/facebook/zstd/archive/${ZSTD_COMMIT}.tar.gz
		-> deepseek-3fs-zstd-${ZSTD_COMMIT}.gh.tar.gz
"

S="${WORKDIR}/3FS-${COMMIT}"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

DEPEND="
	dev-libs/boost:0=
	dev-libs/libuv:=
	dev-libs/re2:=
	app-arch/lz4:=
	virtual/zlib
	dev-libs/libaio
	dev-db/foundationdb
	sys-fs/fuse:3
"
RDEPEND="${DEPEND}"
BDEPEND="
	>=dev-lang/rust-1.85.0
	dev-build/autoconf
	dev-build/automake
"

PATCHES=(
	"${FILESDIR}"/apache-arrow-no-git.patch
)

src_unpack() {
	default
	local submodules=(
		"clickhouse-cpp:${CLICKHOUSE_CPP_COMMIT}"
		"fmt:${FMT_COMMIT}"
		"folly:${FOLLY_COMMIT}"
		"googletest:${GOOGLETEST_COMMIT}"
		"gtest-parallel:${GTEST_PARALLEL_COMMIT}"
		"jemalloc:${JEMALLOC_COMMIT}"
		"leveldb:${LEVELDB_COMMIT}"
		"liburing:${LIBURING_COMMIT}"
		"mimalloc:${MIMALLOC_COMMIT}"
		"pybind11:${PYBIND11_COMMIT}"
		"rocksdb:${ROCKSDB_COMMIT}"
		"scnlib:${SCNLIB_COMMIT}"
		"toml11:${TOML11_COMMIT}"
		"zstd:${ZSTD_COMMIT}"
	)
	for entry in "${submodules[@]}"; do
		local name=${entry%%:*}
		local commit=${entry#*:}
		rmdir "${S}/third_party/${name}" || die
		mv "${WORKDIR}/${name}-${commit}" "${S}/third_party/${name}" || die
	done
}

src_configure() {
	local mycmakeargs=(
		-DSHUFFLE_METHOD=g++11
		-DARROW_SOURCE_DIR="${WORKDIR}/arrow-${ARROW_COMMIT}"
	)
	cmake_src_configure
}

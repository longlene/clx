# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake

DESCRIPTION="Vector database engine with full-text search and vector indexing"
HOMEPAGE="https://zvec.org https://github.com/alibaba/zvec"
SRC_URI="https://github.com/alibaba/zvec/archive/refs/tags/v${PV}.tar.gz -> ${P}.gh.tar.gz"

# Submodule commit hashes pinned to v0.5.0
MY_ANTLR4_COMMIT="7a3f40bc341ddfb463d6e0aa1a6265064d020cb6"
MY_ARROW_COMMIT="ee4d09ebef61c663c1efbfa4c18e518a03b798be"
MY_CPPJIEBA_COMMIT="b3602bef7d1f67521a61788a74fb5801a0e62cd3"
MY_FASTPFOR_COMMIT="2be1f976935b8ff9296b029f574d7f964be9d35d"
MY_GFLAGS_COMMIT="e171aa2d15ed9eb17054558e0b3a6a413bb01067"
MY_GLOG_COMMIT="8f9ccfe770add9e4c64e9b25c102658e3c763b73"
MY_GTEST_COMMIT="703bd9caab50b139428cea1aaff9974ebee5742e"
MY_LIMONP_COMMIT="9d74077dfcdf8073536c97a00bb79d7a3c3fdaba"
MY_LZ4_COMMIT="5ff839680134437dbf4678f3d0c7b371d84f4964"
MY_MAGIC_ENUM_COMMIT="83ab7f4f578bd00e1026a7cd9f7baa4f1a62cbeb"
MY_PROTOBUF_COMMIT="f0dc78d7e6e331b8c6bb2d5283e06aa26883ca7c"
MY_RABITQ_COMMIT="858b0d6c480766d0e4f08fc5e02f34b53d698fad"
MY_ROCKSDB_COMMIT="6a436150417120a3f9732d65a2a5c2b8d19b60fc"
MY_SPARSEHASH_COMMIT="f93c0c69e959c1c77611d0ba8d107aa971338811"
MY_YAML_CPP_COMMIT="9a3624205e8774953ef18f57067b3426c1c5ada6"

SRC_URI+="
	https://github.com/antlr/antlr4/archive/${MY_ANTLR4_COMMIT}.tar.gz
		-> zvec-dep-antlr4-${MY_ANTLR4_COMMIT}.tar.gz
	https://github.com/apache/arrow/archive/${MY_ARROW_COMMIT}.tar.gz
		-> zvec-dep-arrow-${MY_ARROW_COMMIT}.tar.gz
	https://github.com/yanyiwu/cppjieba/archive/${MY_CPPJIEBA_COMMIT}.tar.gz
		-> zvec-dep-cppjieba-${MY_CPPJIEBA_COMMIT}.tar.gz
	https://github.com/fast-pack/FastPFOR/archive/${MY_FASTPFOR_COMMIT}.tar.gz
		-> zvec-dep-FastPFOR-${MY_FASTPFOR_COMMIT}.tar.gz
	https://github.com/gflags/gflags/archive/${MY_GFLAGS_COMMIT}.tar.gz
		-> zvec-dep-gflags-${MY_GFLAGS_COMMIT}.tar.gz
	https://github.com/google/glog/archive/${MY_GLOG_COMMIT}.tar.gz
		-> zvec-dep-glog-${MY_GLOG_COMMIT}.tar.gz
	https://github.com/google/googletest/archive/${MY_GTEST_COMMIT}.tar.gz
		-> zvec-dep-googletest-${MY_GTEST_COMMIT}.tar.gz
	https://github.com/yanyiwu/limonp/archive/${MY_LIMONP_COMMIT}.tar.gz
		-> zvec-dep-limonp-${MY_LIMONP_COMMIT}.tar.gz
	https://github.com/lz4/lz4/archive/${MY_LZ4_COMMIT}.tar.gz
		-> zvec-dep-lz4-${MY_LZ4_COMMIT}.tar.gz
	https://github.com/Neargye/magic_enum/archive/${MY_MAGIC_ENUM_COMMIT}.tar.gz
		-> zvec-dep-magic_enum-${MY_MAGIC_ENUM_COMMIT}.tar.gz
	https://github.com/protocolbuffers/protobuf/archive/${MY_PROTOBUF_COMMIT}.tar.gz
		-> zvec-dep-protobuf-${MY_PROTOBUF_COMMIT}.tar.gz
	https://github.com/VectorDB-NTU/RaBitQ-Library/archive/${MY_RABITQ_COMMIT}.tar.gz
		-> zvec-dep-RaBitQ-Library-${MY_RABITQ_COMMIT}.tar.gz
	https://github.com/facebook/rocksdb/archive/${MY_ROCKSDB_COMMIT}.tar.gz
		-> zvec-dep-rocksdb-${MY_ROCKSDB_COMMIT}.tar.gz
	https://github.com/sparsehash/sparsehash/archive/${MY_SPARSEHASH_COMMIT}.tar.gz
		-> zvec-dep-sparsehash-${MY_SPARSEHASH_COMMIT}.tar.gz
	https://github.com/jbeder/yaml-cpp/archive/${MY_YAML_CPP_COMMIT}.tar.gz
		-> zvec-dep-yaml-cpp-${MY_YAML_CPP_COMMIT}.tar.gz
"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"
IUSE="openmp"

# libaio is required for the DiskAnn plugin on Linux x86_64
DEPEND="dev-libs/libaio"
RDEPEND="${DEPEND}"

src_prepare() {
	# Upstream strips libzvec_c_api.so in a POST_BUILD custom command;
	# remove it so portage's strip phase handles it properly.
	sed -i '/^# Strip symbols in release builds/,/^endif()$/d' \
		src/binding/c/CMakeLists.txt || die

	# Bundled glog builds shared by default but is not installed,
	# leaving an unresolved libglog.so.0 soname dep. Force static.
	sed -i 's/^add_library (glog$/add_library (glog STATIC/' \
		thirdparty/glog/glog-0.5.0/CMakeLists.txt || die

	# bazel.cmake installs PUBINCS without a trailing slash, causing CMake to
	# install the include/ directory itself into DESTINATION include/ (double
	# include/include/). Append / so only the contents are installed.
	sed -i 's|DIRECTORY \${CC_ARGS_PUBINCS} DESTINATION|DIRECTORY ${CC_ARGS_PUBINCS}/ DESTINATION|g' \
		cmake/bazel.cmake || die

	cmake_src_prepare
}

src_unpack() {
	unpack "${P}.gh.tar.gz"

	# Populate git submodules from individual commit archives.
	# GitHub archives extract as REPO-COMMITHASH/ in WORKDIR.
	_place_dep() {
		local tarname=$1 extracted_name=$2 target=$3
		unpack "${tarname}"
		rm -rf "${S}/${target}" || die
		mv "${WORKDIR}/${extracted_name}" "${S}/${target}" || die
	}

	_place_dep "zvec-dep-antlr4-${MY_ANTLR4_COMMIT}.tar.gz" \
		"antlr4-${MY_ANTLR4_COMMIT}" \
		"thirdparty/antlr/antlr4"

	_place_dep "zvec-dep-arrow-${MY_ARROW_COMMIT}.tar.gz" \
		"arrow-${MY_ARROW_COMMIT}" \
		"thirdparty/arrow/apache-arrow-21.0.0"

	_place_dep "zvec-dep-cppjieba-${MY_CPPJIEBA_COMMIT}.tar.gz" \
		"cppjieba-${MY_CPPJIEBA_COMMIT}" \
		"thirdparty/cppjieba/cppjieba-5.6.7"

	_place_dep "zvec-dep-FastPFOR-${MY_FASTPFOR_COMMIT}.tar.gz" \
		"FastPFOR-${MY_FASTPFOR_COMMIT}" \
		"thirdparty/FastPFOR/FastPFOR-0.4.0"

	_place_dep "zvec-dep-gflags-${MY_GFLAGS_COMMIT}.tar.gz" \
		"gflags-${MY_GFLAGS_COMMIT}" \
		"thirdparty/gflags/gflags-2.2.2"

	_place_dep "zvec-dep-glog-${MY_GLOG_COMMIT}.tar.gz" \
		"glog-${MY_GLOG_COMMIT}" \
		"thirdparty/glog/glog-0.5.0"

	_place_dep "zvec-dep-googletest-${MY_GTEST_COMMIT}.tar.gz" \
		"googletest-${MY_GTEST_COMMIT}" \
		"thirdparty/googletest/googletest-1.10.0"

	_place_dep "zvec-dep-limonp-${MY_LIMONP_COMMIT}.tar.gz" \
		"limonp-${MY_LIMONP_COMMIT}" \
		"thirdparty/limonp/limonp-v1.0.2"

	_place_dep "zvec-dep-lz4-${MY_LZ4_COMMIT}.tar.gz" \
		"lz4-${MY_LZ4_COMMIT}" \
		"thirdparty/lz4/lz4-1.9.4"

	_place_dep "zvec-dep-magic_enum-${MY_MAGIC_ENUM_COMMIT}.tar.gz" \
		"magic_enum-${MY_MAGIC_ENUM_COMMIT}" \
		"thirdparty/magic_enum/magic_enum-0.9.7"

	_place_dep "zvec-dep-protobuf-${MY_PROTOBUF_COMMIT}.tar.gz" \
		"protobuf-${MY_PROTOBUF_COMMIT}" \
		"thirdparty/protobuf/protobuf-3.21.12"

	_place_dep "zvec-dep-RaBitQ-Library-${MY_RABITQ_COMMIT}.tar.gz" \
		"RaBitQ-Library-${MY_RABITQ_COMMIT}" \
		"thirdparty/RaBitQ-Library/RaBitQ-Library-0.1"

	_place_dep "zvec-dep-rocksdb-${MY_ROCKSDB_COMMIT}.tar.gz" \
		"rocksdb-${MY_ROCKSDB_COMMIT}" \
		"thirdparty/rocksdb/rocksdb-8.1.1"

	_place_dep "zvec-dep-sparsehash-${MY_SPARSEHASH_COMMIT}.tar.gz" \
		"sparsehash-${MY_SPARSEHASH_COMMIT}" \
		"thirdparty/sparsehash/sparsehash-2.0.4"

	_place_dep "zvec-dep-yaml-cpp-${MY_YAML_CPP_COMMIT}.tar.gz" \
		"yaml-cpp-${MY_YAML_CPP_COMMIT}" \
		"thirdparty/yaml-cpp/yaml-cpp-0.6.3"
}

src_configure() {
	local mycmakeargs=(
		-DBUILD_PYTHON_BINDINGS=OFF
		-DBUILD_TOOLS=OFF
		-DRABITQ_ENABLE_AVX512=OFF
		-DENABLE_OPENMP=$(usex openmp)
		-Dprotobuf_BUILD_SHARED_LIBS=OFF
	)
	cmake_src_configure
}

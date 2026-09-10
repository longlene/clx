# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake

LIBFOR_COMMIT="49611808d08d4e47116aa2a3ddcabeb418f405f7"
H2O_COMMIT="1491a703195790278091fd7aee547fbba78e89af"
S2_COMMIT="efb124d8eaf3433323d3e877dedd5e94a63339a3"
HNSW_COMMIT="21de18ffabea1a9d1e8b16b49afc6045d7707e4c"
KAKASI_COMMIT="9e0825a02c7ea5605e968f6208f769f7c49d6860"
LRUCACHE_COMMIT="13f30ad33a227a3e9682578c450777380ecddfcf"
ROCKSDB_VERSION="6.20.3"
GTEST_VERSION="1.8.0"
LIBICONV_VERSION="1.15"
JEMALLOC_VERSION="5.3.0"
ONNX_VERSION="1.14.0"
ONNX_EXT_COMMIT="36a9c991a20a9fd9eb49909117e2528d64fdeda5"

DESCRIPTION="Fast, typo-tolerant full-text search engine"
HOMEPAGE="https://github.com/typesense/typesense"
SRC_URI="
	https://github.com/typesense/typesense/archive/refs/tags/v${PV}.tar.gz
		-> ${P}.gh.tar.gz
	https://github.com/cruppstahl/libfor/archive/${LIBFOR_COMMIT}.tar.gz
		-> typesense-libfor-${LIBFOR_COMMIT}.tar.gz
	https://github.com/h2o/h2o/archive/${H2O_COMMIT}.tar.gz
		-> typesense-h2o-${H2O_COMMIT}.tar.gz
	https://github.com/facebook/rocksdb/archive/v${ROCKSDB_VERSION}.tar.gz
		-> typesense-rocksdb-${ROCKSDB_VERSION}.tar.gz
	https://github.com/google/googletest/archive/release-${GTEST_VERSION}.tar.gz
		-> typesense-googletest-release-${GTEST_VERSION}.tar.gz
	https://github.com/google/s2geometry/archive/${S2_COMMIT}.tar.gz
		-> typesense-s2geometry-${S2_COMMIT}.tar.gz
	https://github.com/typesense/hnswlib/archive/${HNSW_COMMIT}.tar.gz
		-> typesense-hnswlib-${HNSW_COMMIT}.tar.gz
	https://github.com/typesense/kakasi/archive/${KAKASI_COMMIT}.tar.gz
		-> typesense-kakasi-${KAKASI_COMMIT}.tar.gz
	https://github.com/goldsborough/lru-cache/archive/${LRUCACHE_COMMIT}.tar.gz
		-> typesense-lru-cache-${LRUCACHE_COMMIT}.tar.gz
	https://ftp.gnu.org/pub/gnu/libiconv/libiconv-${LIBICONV_VERSION}.tar.gz
		-> typesense-libiconv-${LIBICONV_VERSION}.tar.gz
	https://github.com/jemalloc/jemalloc/releases/download/${JEMALLOC_VERSION}/jemalloc-${JEMALLOC_VERSION}.tar.bz2
		-> typesense-jemalloc-${JEMALLOC_VERSION}.tar.bz2
	https://github.com/microsoft/onnxruntime/archive/refs/tags/v${ONNX_VERSION}.tar.gz
		-> typesense-onnxruntime-${ONNX_VERSION}.tar.gz
	https://github.com/microsoft/onnxruntime-extensions/archive/${ONNX_EXT_COMMIT}.tar.gz
		-> typesense-onnxruntime-extensions-${ONNX_EXT_COMMIT}.tar.gz
"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64"

DEPEND="
	dev-libs/openssl:0=
	app-arch/snappy:=
	virtual/zlib
	net-misc/curl:=
	dev-libs/icu:=
	dev-libs/protobuf:=
	dev-libs/leveldb:=
	dev-cpp/gflags:=
	dev-cpp/glog:=
	dev-libs/elfutils:=
	dev-libs/brpc:=
	dev-libs/braft:=
"
RDEPEND="${DEPEND}"
BDEPEND="
	dev-build/autoconf
	dev-build/automake
"

PATCHES=(
	"${FILESDIR}"/build-fix.patch
	"${FILESDIR}"/onnxruntime-no-git.patch
)

src_unpack() {
	unpack "${P}.gh.tar.gz"

	# Pre-populate DEP_ROOT_DIR (external-Linux/) with tarballs; cmake will
	# skip downloads and extract locally instead.
	mkdir -p "${S}/external-Linux" || die
	local bundles=(
		"typesense-libfor-${LIBFOR_COMMIT}.tar.gz:libfor-${LIBFOR_COMMIT}.tar.gz"
		"typesense-h2o-${H2O_COMMIT}.tar.gz:h2o-${H2O_COMMIT}.tar.gz"
		"typesense-rocksdb-${ROCKSDB_VERSION}.tar.gz:rocksdb-${ROCKSDB_VERSION}.tar.gz"
		"typesense-googletest-release-${GTEST_VERSION}.tar.gz:googletest-release-${GTEST_VERSION}.tar.gz"
		"typesense-s2geometry-${S2_COMMIT}.tar.gz:s2geometry-${S2_COMMIT}.tar.gz"
		"typesense-hnswlib-${HNSW_COMMIT}.tar.gz:hnswlib-${HNSW_COMMIT}.tar.gz"
		"typesense-kakasi-${KAKASI_COMMIT}.tar.gz:kakasi-${KAKASI_COMMIT}.tar.gz"
		"typesense-lru-cache-${LRUCACHE_COMMIT}.tar.gz:lru-cache-${LRUCACHE_COMMIT}.tar.gz"
		"typesense-libiconv-${LIBICONV_VERSION}.tar.gz:libiconv-${LIBICONV_VERSION}.tar.gz"
		"typesense-jemalloc-${JEMALLOC_VERSION}.tar.bz2:jemalloc-${JEMALLOC_VERSION}.tar.bz2"
	)
	for entry in "${bundles[@]}"; do
		local src="${entry%%:*}"
		local dst="${entry#*:}"
		cp "${DISTDIR}/${src}" "${S}/external-Linux/${dst}" || die
	done

	# onnxruntime and onnxruntime_ext use git in their cmake; supply extracted
	# source directly so the no-git patch can skip the git clone step.
	unpack "typesense-onnxruntime-${ONNX_VERSION}.tar.gz"
	unpack "typesense-onnxruntime-extensions-${ONNX_EXT_COMMIT}.tar.gz"
	mv "${WORKDIR}/onnxruntime-${ONNX_VERSION}" "${S}/external-Linux/onnxruntime" || die
	mv "${WORKDIR}/onnxruntime-extensions-${ONNX_EXT_COMMIT}" "${S}/external-Linux/onnxruntime_ext" || die
}

src_configure() {
	local mycmakeargs=(
		-DTYPESENSE_VERSION="${PV}"
		-DBUILD_DEPS=yes
	)
	cmake_src_configure
}

src_install() {
	dobin "${BUILD_DIR}/typesense-server"
}

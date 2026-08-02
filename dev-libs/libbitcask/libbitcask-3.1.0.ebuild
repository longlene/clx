# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

# Submodule versions (all have tagged releases)
UTF8PROC_PV="2.10.0"
UNORDERED_DENSE_PV="4.8.1"
CPPJIEBA_PV="5.6.7"
LIMONP_PV="1.0.2"

inherit cmake

DESCRIPTION="Bitcask log-structured KV store with BM25 full-text and HNSW vector search"
HOMEPAGE="https://github.com/TTalkPro/libbitcask"
SRC_URI="
	https://github.com/TTalkPro/libbitcask/archive/refs/tags/v${PV}.tar.gz
		-> ${P}.gh.tar.gz
	https://github.com/JuliaStrings/utf8proc/archive/refs/tags/v${UTF8PROC_PV}.tar.gz
		-> utf8proc-${UTF8PROC_PV}.gh.tar.gz
	https://github.com/martinus/unordered_dense/archive/refs/tags/v${UNORDERED_DENSE_PV}.tar.gz
		-> unordered_dense-${UNORDERED_DENSE_PV}.gh.tar.gz
	https://github.com/yanyiwu/cppjieba/archive/refs/tags/v${CPPJIEBA_PV}.tar.gz
		-> cppjieba-${CPPJIEBA_PV}.gh.tar.gz
	https://github.com/yanyiwu/limonp/archive/refs/tags/v${LIMONP_PV}.tar.gz
		-> limonp-${LIMONP_PV}.gh.tar.gz
"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

DEPEND="
	|| ( sys-libs/zlib sys-libs/zlib-ng[compat(-)] )
	dev-cpp/tbb:=
"
RDEPEND="${DEPEND}"

RESTRICT="test"

src_prepare() {
	cp -a "${WORKDIR}/utf8proc-${UTF8PROC_PV}/." "${S}/third_party/utf8proc/" || die
	cp -a "${WORKDIR}/unordered_dense-${UNORDERED_DENSE_PV}/." "${S}/third_party/unordered_dense/" || die
	cp -a "${WORKDIR}/cppjieba-${CPPJIEBA_PV}/." "${S}/third_party/cppjieba/" || die
	cp -a "${WORKDIR}/limonp-${LIMONP_PV}/." "${S}/third_party/limonp/" || die
	cmake_src_prepare
}

src_configure() {
	local mycmakeargs=(
		-DBUILD_TESTING=OFF
		-DBITCASK_BUILD_BENCHMARKS=OFF
		-DBITCASK_WERROR=OFF
		-DBITCASK_LTO=OFF
	)
	cmake_src_configure
}

src_install() {
	cmake_src_install
	insinto /usr/share/libbitcask/jieba
	doins -r "${S}/third_party/cppjieba/dict"
}

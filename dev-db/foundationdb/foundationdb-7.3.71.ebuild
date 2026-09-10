# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake

DESCRIPTION="A distributed, transactional key-value store"
HOMEPAGE="https://github.com/apple/foundationdb"
SRC_URI="https://github.com/apple/foundationdb/archive/refs/tags/${PV}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

DEPEND="
	dev-libs/openssl:=
	virtual/zlib
	dev-libs/jemalloc
"
RDEPEND="${DEPEND}"
BDEPEND="dev-lang/mono"

src_configure() {
	local mycmakeargs=(
		-DOPENSSL_USE_STATIC_LIBS=OFF
		-DOPENSSL_ROOT_DIR=/usr
		-DOPENSSL_CRYPTO_LIBRARY=/usr/lib64/libcrypto.so
		-DOPENSSL_SSL_LIBRARY=/usr/lib64/libssl.so
		-DBUILD_JAVA_BINDING=OFF
		-DBUILD_GO_BINDING=OFF
		-DBUILD_RUBY_BINDING=OFF
		-DBUILD_DOCUMENTATION=OFF
	)
	cmake_src_configure
}

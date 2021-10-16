# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit cmake vcs-snapshot

MY_PN=apache-${PN}
MY_P=${MY_PN}-${PV}

DESCRIPTION="A columnar in-memory analytics layer for big data"
HOMEPAGE="https://arrow.apache.org"
SRC_URI="mirror://apache/${PN}/${P}/${MY_P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="cuda"

DEPEND="
	app-arch/brotli
	app-arch/lz4[static-libs]
	app-arch/snappy-static
	app-arch/zstd[static-libs]
	dev-libs/boost
	dev-libs/flatbuffers
	dev-libs/rapidjson
"
RDEPEND="${DEPEND}"

S="${WORKDIR}"/${MY_P}

CMAKE_BUILD_TYPE=Release
CMAKE_USE_DIR="${S}"/cpp

src_prepare() {
	eapply_user
	sed -e '/BROTLI_STATIC_LIBRARY_DEC/{s#dec#dec-static#g}' \
		-e '/BROTLI_STATIC_LIBRARY_ENC/{s#enc#enc-static#g}' \
		-e '/BROTLI_STATIC_LIBRARY_COMMON/{s#common#common-static#g}' \
		-i cpp/cmake_modules/FindBrotli.cmake
}

src_configure() {
	local mycmakeargs=(
	-DARROW_BUILD_STATIC=OFF
	-DARROW_BUILD_TESTS=OFF
	-DARROW_GPU=$(usex cuda)
	)
	ARROW_BUILD_TOOLCHAIN=/usr cmake_src_configure
}

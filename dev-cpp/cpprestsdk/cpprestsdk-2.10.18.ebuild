# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

inherit cmake

DESCRIPTION="The C++ REST SDK"
HOMEPAGE="https://github.com/Microsoft/cpprestsdk"
SRC_URI="https://github.com/Microsoft/cpprestsdk/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="brotli static-libs +websockets"

DEPEND="
	dev-libs/openssl
	sys-libs/zlib
	brotli? ( app-arch/brotli )
	websockets? ( dev-cpp/websocketpp )
"
RDEPEND="${DEPEND}"

CMAKE_USE_DIR="${S}"/Release

src_configure() {
	local mycmakeargs=(
		-DWERROR=OFF
		-DBUILD_SAMPLES=OFF
		-DCPPREST_EXCLUDE_WEBSOCKETS=$(usex !websockets)
		-DCPPREST_EXCLUDE_BROTLI=$(usex !brotli)
		-DBUILD_SHARED_LIBS=$(usex !static-libs)
	)
	cmake_src_configure
}

# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake

EGIT_COMMIT="3ce62139ee81b743b603b26a19d1d0981df396d5"
EASYWSCLIENT_COMMIT="afc1d8cfc584e0f1f4a77e8c0ce3e979d9fe7ce2"

DESCRIPTION="C++ port of the fastmcp Python library"
HOMEPAGE="https://github.com/0xeb/fastmcpp"
SRC_URI="
	https://github.com/0xeb/fastmcpp/archive/${EGIT_COMMIT}.tar.gz -> ${P}.gh.tar.gz
	https://github.com/dhbaird/easywsclient/archive/${EASYWSCLIENT_COMMIT}.tar.gz -> easywsclient-${EASYWSCLIENT_COMMIT}.gh.tar.gz
"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

DEPEND="
	dev-cpp/cpp-httplib
	dev-cpp/nlohmann_json
	dev-cpp/tiny-process-library
	net-misc/curl
"
RDEPEND="${DEPEND}"
BDEPEND=""

S="${WORKDIR}"/${PN}-${EGIT_COMMIT}

PATCHES=(
	"${FILESDIR}"/system-deps.patch
)

src_configure() {
	local mycmakeargs=(
		-DFASTMCPP_BUILD_TESTS=OFF
		-DFASTMCPP_BUILD_EXAMPLES=OFF
		-DFASTMCPP_ENABLE_POST_STREAMING=ON
		-DFASTMCPP_FETCH_CURL=OFF
		-DFETCHCONTENT_SOURCE_DIR_EASYWSCLIENT="${WORKDIR}"/easywsclient-${EASYWSCLIENT_COMMIT}
	)
	cmake_src_configure
}

src_install() {
	doheader -r include/fastmcpp
	dolib.a ${BUILD_DIR}/libfastmcpp_core.a
	einstalldocs
}

# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake

DESCRIPTION="A framework providing common abstractions for building services"
HOMEPAGE="https://github.com/facebook/wangle"
SRC_URI="https://github.com/facebook/wangle/archive/refs/tags/v${PV}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="Apache-2.0"
SLOT="0/${PV}"
KEYWORDS="amd64 ~arm64"
IUSE="test"

RESTRICT="!test? ( test )"

RDEPEND="
	~dev-cpp/fizz-${PV}:=
	~dev-cpp/folly-${PV}:=
	dev-cpp/gflags:=
	dev-cpp/glog:=[gflags]
	dev-libs/double-conversion:=
	dev-libs/libfmt:=
	dev-libs/openssl:=
"
DEPEND="
	${RDEPEND}
	test? ( dev-cpp/gtest )
"

CMAKE_USE_DIR="${S}"/${PN}

src_configure() {
	local mycmakeargs=(
		-DCMAKE_INSTALL_DIR="$(get_libdir)/cmake/${PN}"
		-DLIB_INSTALL_DIR="$(get_libdir)"
		-DBUILD_TESTS="$(usex test ON OFF)"
	)

	cmake_src_configure
}

src_test() {
	CMAKE_SKIP_TESTS=(
		# These tests expect test certificates to be present in /usr/include/folly/io/async/test/certs/, which folly
		# doesn't install.
		SSLContextManagerTest
	)

	if use arm64; then
		# This test fails on arm64.
		# https://github.com/facebook/wangle/issues/241
		CMAKE_SKIP_TESTS+=(TLSInMemoryTicketProcessorTest)
	fi

	cmake_src_test
}

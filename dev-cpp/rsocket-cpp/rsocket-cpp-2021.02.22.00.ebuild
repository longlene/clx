# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake

DESCRIPTION="C++ implementation of RSocket"
HOMEPAGE="http://rsocket.io/"
SRC_URI="https://github.com/rsocket/rsocket-cpp/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="
	dev-cpp/folly
	dev-cpp/gflags
	dev-cpp/glog
	dev-libs/double-conversion
	dev-libs/openssl
"
RDEPEND="${DEPEND}"
BDEPEND=""

src_configure() {
	local mycmakeargs=(
	-DFOLLY_INSTALL_DIR=/usr
	-DRSOCKET_INSTALL_DEPS=OFF
	-DBUILD_BENCHMARKS=OFF
	-DBUILD_EXAMPLES=OFF
	-DBUILD_TESTS=OFF
	)
	cmake_src_configure
}

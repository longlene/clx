# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake

DESCRIPTION="Facebook's branch of Apache Thrift"
HOMEPAGE="https://github.com/facebook/fbthrift"
SRC_URI="https://github.com/facebook/fbthrift/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

DEPEND="
	dev-cpp/gflags
	dev-cpp/glog
	dev-cpp/folly
	dev-cpp/fizz
	dev-libs/libfmt
	dev-cpp/wangle
	sys-libs/zlib
	app-arch/zstd
	dev-libs/thrift
"
RDEPEND="${DEPEND}"
BDEPEND=""

src_configure() {
	local mycmakeargs=(
		-Dthriftpy=OFF
		-Dthriftpy3=OFF
	)
	cmake_src_configure
}

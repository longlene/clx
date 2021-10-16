# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cmake vcs-snapshot

DESCRIPTION="Industrial-grade RPC framework"
HOMEPAGE="https://github.com/apache/incubator-brpc"
SRC_URI="https://github.com/apache/incubator-brpc/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="thrift"

DEPEND="
	dev-cpp/gflags
	dev-libs/leveldb
	dev-libs/protobuf
	thrift? ( dev-libs/thrift )
"
RDEPEND="${DEPEND}"
BDEPEND=""

src_configure() {
	local mycmakeargs=(
		-DDOWNLOAD_GTEST=OFF
		-DWITH_THRIFT=$(usex thrift)
	)
	cmake_src_configure
}

# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cmake

DESCRIPTION="Industrial-grade RPC framework"
HOMEPAGE="https://brpc.apache.org"
SRC_URI="mirror://apache/brpc/${PV}/apache-${P}-src.tar.gz"

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

S="${WORKDIR}"/apache-${P}-src

src_configure() {
	local mycmakeargs=(
		-DDOWNLOAD_GTEST=OFF
		-DWITH_THRIFT=$(usex thrift)
	)
	cmake_src_configure
}

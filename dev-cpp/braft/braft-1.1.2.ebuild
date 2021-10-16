# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cmake

DESCRIPTION="An industrial-grade C++ implementation of RAFT consensus algorithm based on brpc"
HOMEPAGE="https://github.com/baidu/braft"
SRC_URI="https://github.com/baidu/braft/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND="
	dev-cpp/gflags
	dev-libs/leveldb
	dev-libs/brpc
	dev-libs/protobuf
	dev-libs/openssl
"
RDEPEND="${DEPEND}"
BDEPEND=""

src_configure() {
	local suffix
	if use amd64 ; then
		suffix="64"
	fi
	local mycmakeargs=(
		-DLIBSUFFIX=${suffix}
	)
	cmake_src_configure
}

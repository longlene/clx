# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cmake

DESCRIPTION="RPC based on C++ Workflow"
HOMEPAGE="https://github.com/sogou/srpc"
SRC_URI="
	https://github.com/sogou/srpc/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz
	https://github.com/google/snappy/archive/refs/tags/1.1.9.tar.gz -> snappy-1.1.9.tar.gz
	https://github.com/lz4/lz4/archive/refs/tags/v1.9.3.tar.gz -> lz4-1.9.3.tar.gz
"

LICENSE=""
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND="
	dev-libs/openssl
	dev-libs/protobuf
	dev-cpp/workflow
"
RDEPEND="${DEPEND}"
BDEPEND=""

src_prepare() {
	default
	rmdir third_party/snappy && ln -sv "${WORKDIR}"/snappy-1.1.9 third_party/snappy
	rmdir third_party/lz4 && ln -sv "${WORKDIR}"/lz4-1.9.3 third_party/lz4
	cmake_src_prepare
}

# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cmake

DESCRIPTION="An industrial-grade C++ implementation of RAFT consensus algorithm"
HOMEPAGE="https://github.com/brpc/braft"
SRC_URI="https://github.com/brpc/braft/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE=""
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="
	dev-libs/leveldb
	dev-cpp/gflags
	dev-libs/brpc
	dev-libs/openssl
"
RDEPEND="${DEPEND}"
BDEPEND=""

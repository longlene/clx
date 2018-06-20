# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit cmake-utils

DESCRIPTION="Industrial-grade RPC framework used throughout Baidu"
HOMEPAGE="https://github.com/brpc/brpc"
SRC_URI="https://github.com/brpc/brpc/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND="
	dev-cpp/gflags
	dev-libs/leveldb
	dev-libs/protobuf
"
RDEPEND="${DEPEND}"


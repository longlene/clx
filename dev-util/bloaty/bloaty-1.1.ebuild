# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit cmake

DESCRIPTION="A size profiler for binaries"
HOMEPAGE="https://github.com/google/bloaty"
SRC_URI="
	https://github.com/google/bloaty/archive/v${PV}.tar.gz -> ${P}.tar.gz
	https://github.com/abseil/abseil-cpp/archive/20200225.2.tar.gz -> abseil-cpp-20200225.2.tar.gz
"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND="
	dev-libs/capstone
	>=dev-libs/re2-0.2017.03.01
	dev-libs/protobuf
"
RDEPEND="${DEPEND}"

src_prepare() {
	default
	rmdir third_party/abseil-cpp
	mv ${WORKDIR}/abseil-cpp-20200225.2 third_party/abseil-cpp
}

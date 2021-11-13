# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cmake

DESCRIPTION="Fastest RPC in the west"
HOMEPAGE="https://github.com/smfrpc/smf"
SRC_URI="https://github.com/smfrpc/smf/archive/refs/tags/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND="
	dev-cpp/seastar
	dev-libs/flatbuffers
	dev-cpp/gflags
	dev-cpp/glog
	dev-libs/boost
	dev-libs/hdrhistogram-c
	dev-libs/xxhash
	app-arch/zstd
"
RDEPEND="${DEPEND}"
BDEPEND=""

src_configure() {
	local mycmakeargs=(
		-DSMF_BUILD_PROGRAMS=OFf
		-DSMF_ENABLE_TESTS=OFF
		-DSMF_MANAGE_DEPS=OFF
	)
	cmake_src_configure
}


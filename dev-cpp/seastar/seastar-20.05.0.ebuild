# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit cmake vcs-snapshot

DESCRIPTION="High performance server-side application framework"
HOMEPAGE="http://seastar.io/"
SRC_URI="https://github.com/scylladb/seastar/archive/${P}.tar.gz -> ${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="dpdk +hwloc +numa"

DEPEND="
	app-arch/lz4
	dev-cpp/yaml-cpp
	dev-libs/crypto++
	dev-libs/libfmt
	dev-libs/protobuf
	dev-util/ragel
	sys-fs/xfsprogs
	net-misc/lksctp-tools
	dev-util/valgrind
	dev-util/systemtap
	dpdk? ( net-libs/dpdk )
	hwloc? ( sys-apps/hwloc )
	numa? ( sys-process/numactl )
"
RDEPEND="${DEPEND}"
BDEPEND=""

src_configure() {
	local mycmakeargs=(
			-DSeastar_CXX_FLAGS="-fPIC"
			-DSeastar_APPS=OFF
			-DSeastar_DEMOS=OFF
			-DSeastar_DOCS=OFF
			-DSeastar_TESTING=OFF
			-DSeastar_STD_OPTIONAL_VARIANT_STRINGVIEW=ON
			-DSeastar_DPDK=$(usex dpdk)
			-DSeastar_HWLOC=$(usex hwloc)
			-DSeastar_NUMA=$(usex numa)
	)
	cmake_src_configure
}

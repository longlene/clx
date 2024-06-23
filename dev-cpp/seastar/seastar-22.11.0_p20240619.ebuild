# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

#EGIT_COMMIT="f305841432eb815ecdf5776d3fb7a4df939a2df2"
EGIT_COMMIT="908ccd936a63a37cd98470ad8bf44a20d969c51e"

inherit cmake flag-o-matic vcs-snapshot

DESCRIPTION="High performance server-side application framework"
HOMEPAGE="http://seastar.io/"
SRC_URI="https://github.com/scylladb/seastar/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

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
	dev-debug/valgrind
	dev-debug/systemtap
	sys-libs/liburing
	dpdk? ( net-libs/dpdk )
	hwloc? ( sys-apps/hwloc )
	numa? ( sys-process/numactl )
"
RDEPEND="${DEPEND}"
BDEPEND=""

src_configure() {
	append-cxxflags "-fcoroutines"
	local mycmakeargs=(
		-DSeastar_CXX_FLAGS="-fPIC"
		-DSeastar_APPS=OFF
		-DSeastar_DEMOS=OFF
		-DSeastar_DOCS=OFF
		-DSeastar_TESTING=OFF
		-DSeastar_DPDK=$(usex dpdk)
		-DSeastar_HWLOC=$(usex hwloc)
		-DSeastar_NUMA=$(usex numa)
	)
	cmake_src_configure
}

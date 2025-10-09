# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake flag-o-matic vcs-snapshot

DESCRIPTION="High performance server-side application framework"
HOMEPAGE="http://seastar.io/"
SRC_URI="https://github.com/scylladb/seastar/archive/refs/tags/${P}.tar.gz -> ${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="dpdk +hwloc uring"

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
	dpdk? ( net-libs/dpdk )
	hwloc? ( sys-apps/hwloc )
	uring? ( sys-libs/liburing )
"
RDEPEND="${DEPEND}"
BDEPEND=""

PATCHES=(
	"${FILESDIR}"/system-lz4.patch
)

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
		-DSeastar_IO_URING=$(usex uring)
	)
	cmake_src_configure
}

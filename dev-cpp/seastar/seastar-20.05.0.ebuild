# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit cmake-utils vcs-snapshot

DESCRIPTION="High performance server-side application framework"
HOMEPAGE="http://seastar.io/"
SRC_URI="https://github.com/scylladb/seastar/archive/${P}.tar.gz -> ${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="hwloc numa"

DEPEND="
	app-arch/lz4
	dev-libs/crypto++
	dev-libs/libfmt
	dev-libs/protobuf
	hwloc? ( sys-apps/hwloc )
	numa? ( sys-process/numactl )
"
RDEPEND="${DEPEND}"
BDEPEND=""

src_configure() {
	local mycmakeargs=(
	-DSeastar_DEMOS=OFF
	-DSeastar_DOCS=OFF
	-DSeastar_TESTING=OFF
	-DSeastar_APPS=OFF
	-DSeastar_HWLOC=$(usex hwloc)
	-DSeastar_NUMA=$(usex numa)
	)
	cmake-utils_src_configure
}

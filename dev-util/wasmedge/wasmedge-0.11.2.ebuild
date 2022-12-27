# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake vcs-snapshot

DESCRIPTION="High performance WebAssembly Virtual Machine"
HOMEPAGE="https://github.com/WasmEdge/WasmEdge"
SRC_URI="https://github.com/WasmEdge/WasmEdge/archive/refs/tags/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="ASL-2.0"
SLOT="0"
KEYWORDS="~amd64"

DEPEND="
	sys-devel/llvm
	dev-libs/spdlog
"
RDEPEND="${DEPEND}"
BDEPEND=""

src_configure() {
	local mycmakeargs=(
		-DBUILD_SHARED_LIBS=OFF
		-DWASMEDGE_BUILD_TESTS=OFF
	)
	cmake_src_configure
}

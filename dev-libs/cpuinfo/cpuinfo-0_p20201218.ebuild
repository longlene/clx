# Copyright 2018 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cmake-utils vcs-snapshot

EGIT_COMMIT="5916273f79a21551890fd3d56fc5375a78d1598d"

DESCRIPTION="CPU INFOrmation library (x86/x86-64/ARM/ARM64, Linux/Windows/Android/macOS/iOS)"
HOMEPAGE="https://github.com/pytorch/cpuinfo"
SRC_URI="https://github.com/pytorch/cpuinfo/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

src_configure() {
	local mycmakeargs=(
	-DCPUINFO_LIBRARY_TYPE=shared
	-DCPUINFO_BUILD_UNIT_TESTS=OFF
	-DCPUINFO_BUILD_MOCK_TESTS=OFF
	-DCPUINFO_BUILD_BENCHMARKS=OFF
	-DCPUINFO_RUNTIME_TYPE=shared
	)
	cmake-utils_src_configure
}

src_install() {
	dolib.so ${BUILD_DIR}/lib${PN}.so
	insinto /usr/include
	doins include/cpuinfo.h
	dodoc README.md
}


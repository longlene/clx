# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake

DESCRIPTION="oneAPI Collective Communications Library"
HOMEPAGE="https://github.com/uxlfoundation/oneCCL"
SRC_URI="https://github.com/uxlfoundation/oneCCL/archive/refs/tags/${PV}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"
IUSE="l0"

DEPEND="
	x11-libs/libdrm
	l0? ( dev-libs/level-zero )
"
RDEPEND="${DEPEND}"

PATCHES=(
	"${FILESDIR}"/build-fix.patch
)

src_configure() {
	local mycmakeargs=(
		-DCMAKE_C_COMPILER=icx
		-DCMAKE_CXX_COMPILER=icpx
		-DDPCPP_ROOT=/usr/lib/llvm/intel
		#-DCOMPUTE_BACKEND=dpcpp
		-DBUILD_EXAMPLES=OFF
		-DBUILD_FT=OFF
		-DDRM_INCLUDE_DIR=/usr/include/libdrm
		-DENABLE_MPI_TESTS=OFF
		-DENABLE_OFI_HMEM=OFF
		-DCCL_ENABLE_ZE=$(usex l0)
		-DCMAKE_INSTALL_LIBDIR=$(get_libdir)
		-DMPI_DIR="/usr"
	)
	cmake_src_configure
}

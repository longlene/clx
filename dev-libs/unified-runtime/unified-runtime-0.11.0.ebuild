# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake

OPENCL_HEADERS_COMMIT="1e193332d02e27e15812d24ff2a3a7a908eb92a3"

DESCRIPTION="Unified Runtime"
HOMEPAGE="https://oneapi-src.github.io/unified-runtime/"
SRC_URI="
	https://github.com/oneapi-src/unified-runtime/archive/refs/tags/v${PV}.tar.gz -> ${P}.gh.tar.gz
"
#	opencl? (
#		https://github.com/KhronosGroup/OpenCL-Headers/archive/${OPENCL_HEADERS_COMMIT}.tar.gz -> OpenCL-Headers-${OPENCL_HEADERS_COMMIT}.gh.tar.gz
#	)

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"
IUSE="cuda l0 opencl rocm"

DEPEND="
	>=dev-util/opencl-headers-2024.10.24
	cuda? ( dev-util/nvidia-cuda-toolkit )
	l0? ( dev-libs/level-zero )
	opencl? ( virtual/opencl )
"
RDEPEND="${DEPEND}"
BDEPEND=""

src_prepare() {
	default
	eapply "${FILESDIR}"/system-umf.patch
	#eapply "${FILESDIR}"/umf-fix.patch
	cmake_src_prepare
}

src_configure() {
	local mycmakeargs=(
		-DUR_BUILD_EXAMPLES=OFF
		-DUR_BUILD_TESTS=OFF
		-DUR_BUILD_ADAPTER_L0=$(usex l0)
		-DUR_BUILD_ADAPTER_OPENCL=$(usex opencl)
		-DUR_BUILD_ADAPTER_CUDA=$(usex cuda)
		-DUR_BUILD_ADAPTER_HIP=$(usex rocm)
		-DUR_BUILD_ADAPTER_NATIVE_CPU=ON
	)
	#use opencl && mycmakeargs+=( -DUR_OPENCL_INCLUDE_DIR="${WORKDIR}/OpenCL-Headers-${OPENCL_HEADERS_COMMIT}" )
	use opencl && mycmakeargs+=( -DUR_OPENCL_INCLUDE_DIR="/usr/include" )
	cmake_src_configure
}

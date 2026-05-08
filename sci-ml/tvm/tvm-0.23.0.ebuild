# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_EXT=1
DISTUTILS_OPTIONAL=1
DISTUTILS_USE_PEP517=scikit-build-core
PYTHON_COMPAT=( python3_{13..14} )

inherit cmake distutils-r1

MY_PV=$(ver_rs 3 ".")

DESCRIPTION="Open deep learning compiler stack for cpu, gpu and specialized accelerators"
HOMEPAGE="
	https://tvm.apache.org/
	https://github.com/apache/tvm
"
SRC_URI="
	https://github.com/apache/tvm/archive/refs/tags/v${MY_PV}.tar.gz -> ${P}.tar.gz
"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"
IUSE="cuda nccl opencl vulkan python"

DEPEND="
	dev-cpp/rang
	sci-libs/dmlc-core
	sci-ml/tvm-ffi[python,${PYTHON_USEDEP}]
	cuda? (
		dev-util/nvidia-cuda-toolkit
		nccl? (
			dev-libs/nccl
		)
	)
	opencl? (
		dev-libs/opencl-icd-loader
	)
	vulkan? ( media-libs/vulkan-loader )
"
RDEPEND="${DEPEND}"
BDEPEND=""

S="${WORKDIR}"/${PN}-${MY_PV}

PATCHES=(
	"${FILESDIR}"/system-tvm-ffi.patch
	"${FILESDIR}"/build-fix.patch
	"${FILESDIR}"/install-fix.patch
)

wrap_python() {
	if use python; then
		local phase=$1
		distutils-r1_${phase} "$@"
	fi
}

pkg_setup() {
	python_setup
}

src_prepare() {
	cmake_src_prepare
	wrap_python ${FUNCNAME}
}

src_configure() {
	local mycmakeargs=(
		-DUSE_CUDA=$(usex cuda)
		#-DUSE_CUTLASS=$(usex cuda)
		-DUSE_NCCL=$(usex nccl)
		-DUSE_OPENCL=$(usex opencl)
		-DUSE_VULKAN=$(usex vulkan)
		-DUSE_GTEST=OFF
		-DINSTALL_DEV=ON
	)
	cmake_src_configure
	wrap_python ${FUNCNAME}
}

src_compile() {
	cmake_src_compile
	wrap_python ${FUNCNAME}
}

src_install() {
	cmake_src_install
	wrap_python ${FUNCNAME}
}

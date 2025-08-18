# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake

MY_PV="10.13.0.35"
MY_P="TensorRT-${MY_PV}"

DESCRIPTION="A platform for high-performance deep learning inference on NVIDIA hardware"
HOMEPAGE="https://developer.nvidia.com/tensorrt"
SRC_URI="
	https://github.com/NVIDIA/TensorRT/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz
	https://developer.nvidia.com/downloads/compute/machine-learning/tensorrt/${PV}/tars/TensorRT-${MY_PV}.Linux.x86_64-gnu.cuda-12.9.tar.gz
"

LICENSE="NVIDIA-CUDA"
SLOT="0"
KEYWORDS="~amd64"

DEPEND="
	dev-util/nvidia-cuda-toolkit
	dev-libs/cudnn
"
RDEPEND="${DEPEND}"
BDEPEND=""

S="${WORKDIR}"/TensorRT-${PV}

QA_PREBUILT="
	/usr/lib*/libnvinfer_builder_resource.so.${PV}
  	/usr/lib*/libnvinfer.so.${PV}
"

PATCHES=(
	"${FILESDIR}"/system-cuda.patch
	"${FILESDIR}"/system-onnx.patch
	"${FILESDIR}"/system-protobuf.patch
)

src_configure() {
	local mycmakeargs=(
		-DTRT_LIB_DIR="${WORKDIR}"/TensorRT-${MY_PV}/lib
		-DBUILD_SAMPLES=OFF
	)
	cmake_src_configure
}

src_install() {
	dobin "${WORKDIR}"/${MY_P}/bin/trtexec
	doheader "${WORKDIR}"/${MY_P}/include/Nv*.h
	dolib.so "${WORKDIR}"/${MY_P}/lib/libnvinfer{,_builder_resource,_dispatch,_lean}.so*
	dolib.so "${BUILD_DIR}"/libnvinfer{,_vc}_plugin.so*
	einstalldocs
}

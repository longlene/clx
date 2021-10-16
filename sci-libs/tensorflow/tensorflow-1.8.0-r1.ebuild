# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

#PYTHON_COMPAT=( python2_7 python3_4 python3_5 )

#inherit cmake python-single-r1
inherit cmake

DESCRIPTION="An open-source software library for Machine Intelligence"
HOMEPAGE="https://www.tensorflow.org/"
SRC_URI="https://github.com/tensorflow/tensorflow/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="contrib cuda python example"

DEPEND="
	sys-libs/zlib
	cuda? ( dev-util/nvidia-cuda-toolkit dev-libs/nvidia-cuda-cudnn )
"
RDEPEND="${DEPEND}"

CMAKE_USE_DIR="${S}"/tensorflow/contrib/cmake

src_prepare() {
	eapply_user
	sed -i 's#-DGRPC_ARES=0#-DGRPC_ARES=1#' tensorflow/contrib/cmake/external/grpc.cmake
}

src_configure() {
	local mycmakeargs=(
	-Dtensorflow_BUILD_SHARED_LIB=ON
	-Dtensorflow_ENABLE_GPU=$(usex cuda)
	-Dtensorflow_ENABLE_SSL_SUPPORT=OFF
	-Dtensorflow_BUILD_CC_EXAMPLE=$(usex example)
	-Dtensorflow_BUILD_PYTHON_BINDINGS=$(usex python)
	-Dtensorflow_BUILD_CONTRIB_KERNELS=$(usex contrib)
	-Dtensorflow_PATH_STATIC_LIB=/opt/cuda/lib64
	-Dsystemlib_ALL=ON
	)
	cmake_src_configure
}

src_install() {
	dolib.so ${BUILD_DIR}/libtensorflow.so
	insinto /usr/include/tensorflow/c
	doins tensorflow/c/c_api.h
	dodoc README.md
}

# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_OPTIONAL=1
DISTUTILS_SINGLE_IMPL=1
DISTUTILS_USE_PEP517=no
PYTHON_COMPAT=( python3_{11..13} )

inherit cmake distutils-r1

ONEDNN_CPU_COMMIT="1789b1e0ae441de15d793123003a900a35d1dc71"
ONEDNN_GPU_COMMIT="706a3ce3b391cf1d8a904a8efa981c70078719eb"

DESCRIPTION="An open-source toolkit for optimizing and deploying AI inference"
HOMEPAGE="https://docs.openvino.ai/"
SRC_URI="
	https://github.com/openvinotoolkit/openvino/archive/refs/tags/${PV}.tar.gz -> ${P}.gh.tar.gz
	https://github.com/openvinotoolkit/oneDNN/archive/${ONEDNN_CPU_COMMIT}.tar.gz -> oneDNN-${ONEDNN_CPU_COMMIT}.gh.tar.gz
	https://github.com/oneapi-src/oneDNN/archive/${ONEDNN_GPU_COMMIT}.tar.gz -> oneDNN-${ONEDNN_GPU_COMMIT}.gh.tar.gz
"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"
IUSE="-l0 onednn opencl python test"

DEPEND="
	sys-libs/zlib
	>=dev-cpp/clhpp-2024.10.24
	dev-cpp/tbb
	dev-libs/mlas
	dev-libs/xbyak
	dev-libs/pugixml
	dev-libs/flatbuffers
	dev-libs/protobuf
	app-arch/snappy
	l0? ( dev-libs/level-zero )
	opencl? ( virtual/opencl )
"
#	onednn? ( dev-libs/oneDNN )
RDEPEND="
	${DEPEND}
	${PYTHON_DEPS}
	$(python_gen_cond_dep '
		dev-python/pybind11[${PYTHON_USEDEP}]
	')
"
BDEPEND=""

pkg_setup() {
	use python && python_setup
}

src_prepare() {
	default
	eapply \
		"${FILESDIR}"/openvino-disable-werror.patch \
		"${FILESDIR}"/010-openvino-change-install-paths.patch \
		"${FILESDIR}"/system-l0.patch \
		"${FILESDIR}"/system-mlas.patch \
		"${FILESDIR}"/python-install-path.patch \
		"${FILESDIR}"/040-openvino-protobuf23-fix.patch
	sed -e '/target_include_directories(openvino_core_dev SYSTEM INTERFACE/{s#SYSTEM ##}' \
		-i src/core/CMakeLists.txt
	sed -e '/target_include_directories/{s#SYSTEM PRIVATE#PRIVATE#}' \
		-i src/inference/CMakeLists.txt
	sed -e '/find_host_package(Flatbuffers/{s#QUIET NAMES#QUIET NAMES flatbuffers#}' \
		-i thirdparty/dependencies.cmake

	rmdir src/plugins/intel_cpu/thirdparty/onednn && ln -sv "${WORKDIR}"/oneDNN-${ONEDNN_CPU_COMMIT} src/plugins/intel_cpu/thirdparty/onednn
	rmdir src/plugins/intel_gpu/thirdparty/onednn_gpu && ln -sv "${WORKDIR}"/oneDNN-${ONEDNN_GPU_COMMIT} src/plugins/intel_gpu/thirdparty/onednn_gpu
	pushd "${WORKDIR}"/oneDNN-${ONEDNN_GPU_COMMIT} && eapply "${FILESDIR}"/dnnl-sycl.patch && popd
	cmake_src_prepare
}

src_configure() {
	local mycmakeargs=(
		-DENABLE_CPPLINT=OFF
		-DENABLE_CLANG_FORMAT=OFF
		-DENABLE_NCC_STYLE=OFF
		-DENABLE_TESTS=$(usex test)
		-DENABLE_SYSTEM_LEVEL_ZERO=ON
		-DENABLE_INTEL_NPU=$(usex l0)
		-DENABLE_INTEL_NPU=OFF
		-DENABLE_INTEL_GPU=$(usex opencl)
		-DENABLE_ONEDNN_FOR_GPU=$(usex onednn)
		-DENABLE_PLUGINS_XML=ON
		-DENABLE_FUNCTIONAL_TESTS=$(usex test)
		-DENABLE_SAMPLES=OFF
		-DENABLE_SYSTEM_PUGIXML=ON
		-DENABLE_SYSTEM_FLATBUFFERS=ON
		-DENABLE_SYSTEM_TBB=ON
		-DENABLE_SYSTEM_OPENCL=$(usex opencl)
		-DENABLE_SYSTEM_PROTOBUF=ON
		-DENABLE_SYSTEM_SNAPPY=ON
		-DENABLE_OV_ONNX_FRONTEND=OFF
		-DENABLE_JS=OFF
		-DENABLE_PYTHON=$(usex python)
	)
	cmake_src_configure
}

src_install() {
	cmake_src_install
	use python && python_optimize
}

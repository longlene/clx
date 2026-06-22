# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake

# Bundled dependency versions (sourced by tflite cmake modules)
_TF_VER="2.21.0-rc0"
_XNNPACK_COMMIT="bccfe73347861f07a0257c0c546c0babcf3257b8"
_PTHREADPOOL_COMMIT="9003ee6c137cea3b94161bd5c614fb43be523ee1"
_FXDIV_COMMIT="b408327ac2a15ec3e43352421954f5b1967701d1"
_FP16_COMMIT="0a92994d729ff76a58f692d3028ca1b64b145d91"
_ABSL_COMMIT="255c84dadd029fd8ad25c5efb5933e47beaa00c7"
_CPUINFO_COMMIT="8a9210069b5a37dd89ed118a783945502a30a4ae"
_EIGEN_COMMIT="dcbaf2d608f306450f1e74949eb87e9a22a7ef4b"
_FARMHASH_COMMIT="0d859a811870d10f53a594927d0d0b97573ad06d"
_FB_VER="25.9.23"
_GEMMLOWP_COMMIT="16e8662c34917be0065110bfcd9cc27d30f52fdf"
_MLDTYPES_COMMIT="00d98cd92ade342fef589c0470379abb27baebe9"
_NEON2SSE_COMMIT="a15b489e1222b2087007546b4912e21293ea86ff"
_PROTOBUF_COMMIT="90b73ac3f0b10320315c2ca0d03a5a9b095d2f66"
_RUY_COMMIT="3286a34cc8de6149ac6844107dfdffac91531e72"

DESCRIPTION="Google AI Edge LiteRT on-device ML runtime library"
HOMEPAGE="https://ai.google.dev/edge/litert https://github.com/google-ai-edge/LiteRT"
SRC_URI="
	https://github.com/google-ai-edge/LiteRT/archive/refs/tags/v${PV}.tar.gz -> ${P}.gh.tar.gz
	https://github.com/tensorflow/tensorflow/archive/refs/tags/v${_TF_VER}.tar.gz -> tensorflow-${_TF_VER}.gh.tar.gz
	https://github.com/google/XNNPACK/archive/${_XNNPACK_COMMIT}.tar.gz -> xnnpack-${_XNNPACK_COMMIT:0:7}.gh.tar.gz
	https://github.com/google/pthreadpool/archive/${_PTHREADPOOL_COMMIT}.tar.gz -> pthreadpool-${_PTHREADPOOL_COMMIT:0:7}.gh.tar.gz
	https://github.com/Maratyszcza/FXdiv/archive/${_FXDIV_COMMIT}.tar.gz -> FXdiv-${_FXDIV_COMMIT:0:7}.gh.tar.gz
	https://github.com/Maratyszcza/FP16/archive/${_FP16_COMMIT}.tar.gz -> FP16-${_FP16_COMMIT:0:7}.gh.tar.gz
	https://github.com/abseil/abseil-cpp/archive/${_ABSL_COMMIT}.tar.gz -> abseil-cpp-${_ABSL_COMMIT:0:7}.gh.tar.gz
	https://github.com/pytorch/cpuinfo/archive/${_CPUINFO_COMMIT}.tar.gz -> cpuinfo-${_CPUINFO_COMMIT:0:7}.gh.tar.gz
	https://gitlab.com/libeigen/eigen/-/archive/${_EIGEN_COMMIT}/eigen-${_EIGEN_COMMIT}.tar.bz2 -> eigen-${_EIGEN_COMMIT:0:7}.gl.tar.bz2
	https://github.com/google/farmhash/archive/${_FARMHASH_COMMIT}.tar.gz -> farmhash-${_FARMHASH_COMMIT:0:7}.gh.tar.gz
	https://storage.googleapis.com/mirror.tensorflow.org/github.com/petewarden/OouraFFT/archive/v1.0.tar.gz -> fft2d-v1.0.tar.gz
	https://github.com/google/flatbuffers/archive/refs/tags/v${_FB_VER}.tar.gz -> flatbuffers-${_FB_VER}.gh.tar.gz
	https://github.com/google/gemmlowp/archive/${_GEMMLOWP_COMMIT}.tar.gz -> gemmlowp-${_GEMMLOWP_COMMIT:0:7}.gh.tar.gz
	https://github.com/jax-ml/ml_dtypes/archive/${_MLDTYPES_COMMIT}.tar.gz -> ml_dtypes-${_MLDTYPES_COMMIT:0:7}.gh.tar.gz
	https://storage.googleapis.com/mirror.tensorflow.org/github.com/intel/ARM_NEON_2_x86_SSE/archive/${_NEON2SSE_COMMIT}.tar.gz -> neon2sse-${_NEON2SSE_COMMIT:0:7}.tar.gz
	https://github.com/protocolbuffers/protobuf/archive/${_PROTOBUF_COMMIT}.tar.gz -> protobuf-${_PROTOBUF_COMMIT:0:7}.gh.tar.gz
	https://github.com/google/ruy/archive/${_RUY_COMMIT}.tar.gz -> ruy-${_RUY_COMMIT:0:7}.gh.tar.gz
"

S="${WORKDIR}/LiteRT-${PV}"
CMAKE_USE_DIR="${S}/litert"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

BDEPEND="dev-build/cmake"

src_prepare() {
	cmake_src_prepare
	# Block all proprietary vendor SDK downloads (Qualcomm QNN, MediaTek
	# NeuroPilot, Samsung LiteCore). These are not freely redistributable.
	sed -i \
		-e '/set(NEUROPILOT_HEADERS_URL "https:\/\//s/^/#DISABLED: /' \
		-e '/set(QAIRT_HEADERS_URL "https:\/\//s/^/#DISABLED: /' \
		-e '/set(QAIRT_HEADERS_SUBDIR /s/^/#DISABLED: /' \
		-e '/set(LITECORE_HEADERS_URL "https:\/\//s/^/#DISABLED: /' \
		"${S}/litert/vendors/CMakeLists.txt" || die
	# System cl_ext.h (>=0.9.3) gates cl_command_buffer_khr et al. behind
	# CL_ENABLE_BETA_EXTENSIONS; the bundled KhronosGroup headers pre-date
	# that guard.  open_cl_sync.cc and open_cl_memory.cc are compiled even
	# when GPU is disabled, so we must expose the beta types.
	sed -i \
		-e 's/-DLITERT_USE_XNNPACK/-DLITERT_USE_XNNPACK\n\t\t-DCL_ENABLE_BETA_EXTENSIONS/' \
		"${S}/litert/runtime/CMakeLists.txt" || die
	# Rename XNNPACK source dir to match what cmake expects from FetchContent
	mv "${WORKDIR}/XNNPACK-${_XNNPACK_COMMIT}" \
		"${WORKDIR}/xnnpack-src" || die
}

src_configure() {
	local mycmakeargs=(
		# Build all bundled deps as static so libLiteRt.so is self-contained
		-DBUILD_SHARED_LIBS=OFF
		# TFLite GPU disabled; XNNPACK built from bundled source
		-DTFLITE_ENABLE_GPU=OFF
		-DTFLITE_ENABLE_XNNPACK=ON
		-DXNNPACK_BUILD_TESTS=OFF
		-DXNNPACK_BUILD_BENCHMARKS=OFF
		# LiteRT options
		-DLITERT_BUILD_TESTS=OFF
		-DLITERT_ENABLE_GPU=OFF
		-DLITERT_ENABLE_NPU=OFF
		-DLITERT_ENABLE_SAMSUNG=OFF
		-DLITERT_ENABLE_QUALCOMM=OFF
		# TF monorepo source dir (needed by tflite for TSL/XLA/mlir-lite headers)
		-DTENSORFLOW_SOURCE_DIR="${WORKDIR}/tensorflow-${_TF_VER}"
		# Pre-downloaded FetchContent dep sources (avoids network access)
		-DFETCHCONTENT_FULLY_DISCONNECTED=ON
		-DCMAKE_POLICY_VERSION_MINIMUM=3.5
		"-DFETCHCONTENT_SOURCE_DIR_ABSEIL-CPP=${WORKDIR}/abseil-cpp-${_ABSL_COMMIT}"
		-DFETCHCONTENT_SOURCE_DIR_CPUINFO="${WORKDIR}/cpuinfo-${_CPUINFO_COMMIT}"
		-DFETCHCONTENT_SOURCE_DIR_EIGEN="${WORKDIR}/eigen-${_EIGEN_COMMIT}"
		-DFETCHCONTENT_SOURCE_DIR_FARMHASH="${WORKDIR}/farmhash-${_FARMHASH_COMMIT}"
		"-DFETCHCONTENT_SOURCE_DIR_FFT2D=${WORKDIR}/OouraFFT-1.0"
		-DFETCHCONTENT_SOURCE_DIR_FLATBUFFERS="${WORKDIR}/flatbuffers-${_FB_VER}"
		-DFETCHCONTENT_SOURCE_DIR_GEMMLOWP="${WORKDIR}/gemmlowp-${_GEMMLOWP_COMMIT}"
		-DFETCHCONTENT_SOURCE_DIR_ML_DTYPES="${WORKDIR}/ml_dtypes-${_MLDTYPES_COMMIT}"
		-DFETCHCONTENT_SOURCE_DIR_NEON2SSE="${WORKDIR}/ARM_NEON_2_x86_SSE-${_NEON2SSE_COMMIT}"
		-DFETCHCONTENT_SOURCE_DIR_PROTOBUF="${WORKDIR}/protobuf-${_PROTOBUF_COMMIT}"
		-DFETCHCONTENT_SOURCE_DIR_RUY="${WORKDIR}/ruy-${_RUY_COMMIT}"
		-DFETCHCONTENT_SOURCE_DIR_XNNPACK="${WORKDIR}/xnnpack-src"
		# Pre-downloaded sub-dep sources to avoid ExternalProject_Add network access
		-DPTHREADPOOL_SOURCE_DIR="${WORKDIR}/pthreadpool-${_PTHREADPOOL_COMMIT}"
		-DFXDIV_SOURCE_DIR="${WORKDIR}/FXdiv-${_FXDIV_COMMIT}"
		-DFP16_SOURCE_DIR="${WORKDIR}/FP16-${_FP16_COMMIT}"
		-DLITERT_XNNPACK_INCLUDE_DIR="${WORKDIR}/xnnpack-src/include"
		-DLITERT_PTHREADPOOL_INCLUDE_DIR="${WORKDIR}/pthreadpool-${_PTHREADPOOL_COMMIT}/include"
		-DCPUINFO_SOURCE_DIR="${WORKDIR}/cpuinfo-${_CPUINFO_COMMIT}"
	)
	cmake_src_configure
}

src_install() {
	cmake_src_install
	# Install the C API shared library (cmake has no install() rule for it)
	dolib.so "${BUILD_DIR}/c/libLiteRt.so"
	# Install public C API headers
	local hdr
	while IFS= read -r -d '' hdr; do
		local rel="${hdr#${S}/litert/}"
		insinto "/usr/include/litert/$(dirname "${rel}")"
		doins "${hdr}"
	done < <(find "${S}/litert/c" -name "litert_*.h" -print0)
	# Install public C++ API headers
	while IFS= read -r -d '' hdr; do
		local rel="${hdr#${S}/litert/}"
		insinto "/usr/include/litert/$(dirname "${rel}")"
		doins "${hdr}"
	done < <(find "${S}/litert/cc" -maxdepth 1 -name "litert_*.h" -print0)
}

# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_SINGLE_IMPL=1
DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{13..15} )

inherit distutils-r1

KALDIFEAT_VER="1.20"
MODERNGPU_COMMIT="8ec9ac0de8672de7217d014917eedec5317f75f3"

DESCRIPTION="FSA/FST algorithms, differentiable, with PyTorch compatibility"
HOMEPAGE="https://k2-fsa.github.io/k2 https://github.com/k2-fsa/k2"
SRC_URI="
	https://github.com/k2-fsa/k2/archive/refs/tags/v${PV}.tar.gz -> ${P}.gh.tar.gz
	https://github.com/csukuangfj/kaldifeat/archive/refs/tags/v${KALDIFEAT_VER}.tar.gz
		-> kaldifeat-${KALDIFEAT_VER}.tar.gz
	cuda? (
		https://github.com/moderngpu/moderngpu/archive/${MODERNGPU_COMMIT}.tar.gz
			-> moderngpu-${MODERNGPU_COMMIT}.tar.gz
	)
"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"
IUSE="cuda"

RDEPEND="
	sci-ml/pytorch[${PYTHON_SINGLE_USEDEP}]
	$(python_gen_cond_dep '
		dev-python/graphviz[${PYTHON_USEDEP}]
	')
"
DEPEND="${RDEPEND}"
BDEPEND="
	dev-build/cmake
	dev-python/pybind11
	cuda? ( dev-util/nvidia-cuda-toolkit )
"

src_prepare() {
	# Use system pybind11 (3.0+) instead of bundled 2.11 which has factory template ambiguity
	printf 'find_package(pybind11 CONFIG REQUIRED)\n' > "${S}/cmake/pybind11.cmake" || die
	# The standalone C++ binaries (ctc_decode, hlg_decode) need httplib from libtorch_cpu.so
	# which requires a separate libcpp-httplib link; skip them — k2's Python extension is enough
	sed -i 's/^add_subdirectory(bin)$/#add_subdirectory(bin)/' \
		"${S}/k2/torch/CMakeLists.txt" || die
	# kaldifeat log.h uses uint32_t without including <cstdint>
	sed -i 's|#include <cstdlib>|#include <cstdlib>\n#include <cstdint>|' \
		"${WORKDIR}/kaldifeat-${KALDIFEAT_VER}/kaldifeat/csrc/log.h" || die
	# CUDA 13+ dropped compute_50/60/61/70; keep only 35 and 75+ which are still
	# added by the version-conditional blocks in k2's cmake (80, 86, 90)
	sed -i 's/set(K2_COMPUTE_ARCH_CANDIDATES 35 50 60 61 70 75)/set(K2_COMPUTE_ARCH_CANDIDATES 35 75)/' \
		"${S}/CMakeLists.txt" || die
	# cub::Sum was removed in CUDA 13 CCCL; replace with cuda::std::plus<>{}
	sed -i 's/cub::Sum()/::cuda::std::plus<>{}/g' \
		"${S}/k2/csrc/utils_inl.h" || die
	# cudaDeviceProp.memoryClockRate and .clockRate removed in CUDA 13
	sed -i 's/prop\.memoryClockRate/0/g; s/prop\.clockRate/0/g' \
		"${WORKDIR}/moderngpu-${MODERNGPU_COMMIT}/src/moderngpu/context.hxx" || die
	# PairOutputIterator constructor needs __host__ __device__ for CCCL 3.x
	sed -i 's/explicit PairOutputIterator(int32_t \*i)/explicit __host__ __device__ PairOutputIterator(int32_t *i)/' \
		"${S}/k2/csrc/ragged_ops_inl.h" || die
	# PairOutputIterator lacks operator* and operator+= required by CCCL 3.x
	perl -i -0777 -pe \
		's|(return PairOutputIterator\{i_ \+ offset\};\n  \}\n)(  int32_t)|${1}  __device__ __forceinline__ PairOutputIteratorDeref<T> operator*() const {\n    return PairOutputIteratorDeref<T>(i_);\n  }\n  __device__ __forceinline__ PairOutputIterator\& operator+=(std::ptrdiff_t offset) {\n    i_ += offset; return *this;\n  }\n${2}|' \
		"${S}/k2/csrc/ragged_ops_inl.h" || die
	# HashOutputIterator in ragged_ops.cu has same CCCL 3.x compatibility issues
	sed -i 's/explicit HashOutputIterator(T \*t)/explicit __host__ __device__ HashOutputIterator(T *t)/' \
		"${S}/k2/csrc/ragged_ops.cu" || die
	perl -i -0777 -pe \
		's|(return HashOutputIterator\{t_ \+ offset\};\n  \}\n)(  T \*t_;)|${1}  __device__ __forceinline__ HashOutputIteratorDeref<T> operator*() const {\n    return HashOutputIteratorDeref<T>(t_);\n  }\n  __device__ __forceinline__ HashOutputIterator\& operator+=(std::ptrdiff_t offset) {\n    t_ += offset; return *this;\n  }\n${2}|' \
		"${S}/k2/csrc/ragged_ops.cu" || die
	# Newer PyTorch already defines type_caster<at::ScalarType>; remove k2's duplicate
	perl -i -0777 -pe \
		's/namespace pybind11 \{.*?\}  \/\/ namespace pybind11\n//s' \
		"${S}/k2/python/csrc/torch.h" || die
	# pybind11 3.x py::make_tuple returns typed Tuple<...>; two return statements with
	# different tuple sizes need an explicit return type to resolve the deduction ambiguity
	sed -i 's/\[](const PyClass &obj) {/[](const PyClass \&obj) -> py::object {/' \
		"${S}/k2/python/csrc/torch/ragged.cu" || die
	# k2 builds ${TORCH_DIR}/lib/libtorch_python.so path from torch.__file__ which points
	# to site-packages; on Gentoo the library is in /usr/lib64 — link by name instead
	sed -i 's|${TORCH_DIR}/lib/libtorch_python\.so|torch_python|g' \
		"${S}/k2/python/csrc/CMakeLists.txt" || die
	# torch::make_unique removed from newer PyTorch; std::make_unique is equivalent
	sed -i 's/torch::make_unique/std::make_unique/g' \
		"${S}/k2/torch/csrc/deserialization.cu" || die
	distutils-r1_src_prepare
}

python_compile() {
	local kaldifeat_dir="${WORKDIR}/kaldifeat-${KALDIFEAT_VER}"

	local cmake_args="-DCMAKE_BUILD_TYPE=Release"
	cmake_args+=" -DCMAKE_CXX_STANDARD=17"
	cmake_args+=" -DK2_WITH_CUDA=$(usex cuda ON OFF)"
	cmake_args+=" -DK2_ENABLE_NVTX=OFF"
	cmake_args+=" -DFETCHCONTENT_FULLY_DISCONNECTED=ON"
	cmake_args+=" -DFETCHCONTENT_SOURCE_DIR_KALDIFEAT=${kaldifeat_dir}"
	if use cuda; then
		local moderngpu_dir="${WORKDIR}/moderngpu-${MODERNGPU_COMMIT}"
		cmake_args+=" -DFETCHCONTENT_SOURCE_DIR_MODERNGPU=${moderngpu_dir}"
	fi

	K2_CMAKE_ARGS="${cmake_args}" distutils-r1_python_compile
}

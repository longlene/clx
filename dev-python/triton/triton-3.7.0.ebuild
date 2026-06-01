# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

LLVM_COMPAT=( 22 )

DISTUTILS_EXT=1
DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{13..14} )

inherit distutils-r1 llvm-r2

DESCRIPTION="A language and compiler for custom Deep Learning operations"
HOMEPAGE="
	https://github.com/triton-lang/triton
	https://triton-lang.org/
"
SRC_URI="
	https://github.com/triton-lang/triton/archive/refs/tags/v${PV}.tar.gz -> ${P}.gh.tar.gz
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

DEPEND+="
	app-arch/zstd
	dev-libs/libffi
	dev-util/nvidia-cuda-toolkit
	virtual/zlib
	$(llvm_gen_dep '
		llvm-core/lld:${LLVM_SLOT}
		llvm-core/mlir:${LLVM_SLOT}[test]
	')
"

BDEPEND="
	dev-python/pybind11[${PYTHON_USEDEP}]
"
#BDEPEND="
#	test? (
#	)
#"

distutils_enable_tests pytest

PATCHES=(
	"${FILESDIR}"/build-fix.patch
)

pkg_setup() {
	llvm-r2_pkg_setup
	python_setup

	export JSON_SYSPATH="/usr"
	export TRITON_BUILD_WITH_CCACHE=OFF
	export TRITON_OFFLINE_BUILD=ON
	export TRITON_CUPTI_INCLUDE_PATH="/opt/cuda/extras/CUPTI/include"
	export LLVM_SYSPATH="$(get_llvm_prefix)"
	export TRITON_APPEND_CMAKE_ARGS="-DLLVM_LIBRARY_DIR=${LLVM_SYSPATH}/$(get_libdir)"
}

QA_PRESTRIPPED="
	/usr/lib/python*/site-packages/triton/FileCheck
"

python_install() {
	distutils-r1_python_install

	# triton expects ptxas/cuobjdump/nvdisasm in backends/nvidia/bin/
	# pip packages bundle these; we symlink to the system CUDA toolkit instead
	local nvidia_bin="$(python_get_sitedir)/triton/backends/nvidia/bin"
	dodir "${nvidia_bin}"
	for tool in ptxas cuobjdump nvdisasm; do
		[[ -x /opt/cuda/bin/${tool} ]] &&
			dosym /opt/cuda/bin/${tool} "${nvidia_bin}/${tool}"
	done
	# ptxas-blackwell only exists in CUDA 13+ (Blackwell GPUs)
	[[ -x /opt/cuda/bin/ptxas-blackwell ]] &&
		dosym /opt/cuda/bin/ptxas-blackwell "${nvidia_bin}/ptxas-blackwell"

	# driver.c is compiled at runtime and needs the CUDA Driver API header
	local nvidia_inc="$(python_get_sitedir)/triton/backends/nvidia/include"
	dodir "${nvidia_inc}"
	dosym /opt/cuda/targets/x86_64-linux/include/cuda.h "${nvidia_inc}/cuda.h"
}

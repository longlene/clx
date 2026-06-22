# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_EXT=1
DISTUTILS_SINGLE_IMPL=1
DISTUTILS_USE_PEP517=scikit-build-core
PYTHON_COMPAT=( python3_{13..15} )

inherit distutils-r1

TVM_COMMIT="ec7f7bd92c185d8c0b84a5dc17709a0860aa5714"

DESCRIPTION="A tile level programming language to generate high performance code"
HOMEPAGE="
	https://pypi.org/project/tilelang/
	https://github.com/tile-ai/tilelang
	https://tilelang.com/
"
SRC_URI="
	https://github.com/tile-ai/tilelang/archive/refs/tags/v${PV}.tar.gz -> ${P}.gh.tar.gz
	https://github.com/TileLang/tvm/archive/${TVM_COMMIT}.tar.gz -> tilelang-tvm-${TVM_COMMIT}.tar.gz
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE="cuda rocm"

RDEPEND="
	sci-ml/pytorch[${PYTHON_SINGLE_USEDEP}]
	$(python_gen_cond_dep '
		sci-ml/torch-c-dlpack-ext[${PYTHON_USEDEP}]
		dev-python/cloudpickle[${PYTHON_USEDEP}]
		dev-python/ml-dtypes[${PYTHON_USEDEP}]
		>=dev-python/numpy-1.23.5[${PYTHON_USEDEP}]
		dev-python/psutil[${PYTHON_USEDEP}]
		>=dev-python/tqdm-4.62.3[${PYTHON_USEDEP}]
		>=dev-python/typing-extensions-4.10.0[${PYTHON_USEDEP}]
	')
"
BDEPEND="
	>=sci-mathematics/z3-4.13.0[python,${PYTHON_SINGLE_USEDEP}]
"
#BDEPEND="
#	test? (
#	)
#"

EPYTEST_PLUGINS=()
distutils_enable_tests pytest

PATCHES=(
	"${FILESDIR}"/build-fix.patch
	"${FILESDIR}"/ir-no-shallow-copy.patch
)

export WITH_PIP_CUDA_TOOLCHAIN="/opt/cuda"

src_prepare() {
	rmdir 3rdparty/tvm && ln -sv "${WORKDIR}"/tvm-${TVM_COMMIT} 3rdparty/tvm
	pushd 3rdparty/tvm \
		&& sed -i \
			-e 's/tvm_ffi_header/tvm_ffi::header/g' \
			-e 's/tvm_ffi_static/tvm_ffi::static/g' \
			-e 's/tvm_ffi_shared/tvm_ffi::shared/g' \
			-e 's|add_subdirectory(3rdparty/tvm-ffi)|find_package(tvm_ffi REQUIRED)|' \
			CMakeLists.txt || die \
		&& perl -0777 -i -pe \
			's/\n\nnamespace tvm \{\nnamespace ffi \{.*?\}  \/\/ namespace tvm(?=\n#endif  \/\/ TVM_IR_REPR_H_)/\n/s' \
			include/tvm/ir/repr.h || die \
		&& find include -name "*.h" -exec sed -i \
			-e 's/SEqHashDef()/SEqHashDefRecursive()/g' {} + \
		&& popd
	# TVM fork uses 'tvm' not 'tvm_compiler'; replace on non-Windows
	sed -i \
		-e 's/tvm_compiler/tvm/g' \
		CMakeLists.txt || die
	distutils-r1_src_prepare
}

python_configure_all() {
	DISTUTILS_ARGS=(
		-DUSE_CUDA=$(usex cuda)
		-DUSE_ROCM=$(usex rocm)
	)
}

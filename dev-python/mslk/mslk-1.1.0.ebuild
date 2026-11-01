# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_SINGLE_IMPL=1
DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{13..15} )

inherit distutils-r1

DESCRIPTION="Collection of PyTorch GPU operators for MoE, GEMM, attention and quantization"
HOMEPAGE="
	https://github.com/meta-pytorch/mslk
	https://pypi.org/project/mslk/
"
SRC_URI="https://github.com/meta-pytorch/mslk/archive/refs/tags/v${PV}.tar.gz -> ${P}.gh.tar.gz"
S="${WORKDIR}/MSLK-${PV}"

# upstream LICENSE is the 3-clause BSD text, ::gentoo calls that one BSD
LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~arm64"
# the upstream test suite drives the compiled torch.ops.mslk kernels on a GPU
RESTRICT="test"

RDEPEND="
	>=sci-ml/pytorch-2.10.0[${PYTHON_SINGLE_USEDEP}]
	$(python_gen_cond_dep '
		dev-python/numpy[${PYTHON_USEDEP}]
		dev-python/packaging[${PYTHON_USEDEP}]
		dev-python/pyre-extensions[${PYTHON_USEDEP}]
		dev-python/triton[${PYTHON_USEDEP}]
	')
"

# Built with MSLK_PYTHON_ONLY=1, upstream's supported no-native-build path
# (the mslk wheel on PyPI is exactly that): setup.py then skips the
# scikit-build/CMake/nvcc build of libmslk.so and mslk/__init__.py skips
# loading it, so the Triton kernels and the Python operator front-ends are
# usable while torch.ops.mslk stays unregistered.  Building the native side
# would additionally need the external/cutlass submodule from its jwfromm
# fork (not the ::gentoo dev-libs/cutlass) and
# dev-python/setuptools-git-versioning, which nothing here depends on yet.
#
# Lazily imported optional dependencies that are not packaged in this tree:
# import cutlass -- the NVIDIA CuTe DSL Python bindings, used by the
# Blackwell-only mslk/attention/flash_attn,
# mslk/attention/cutlass_blackwell_fmha and
# mslk/gemm/blackwell_mixed_input_gemm modules.
PATCHES=( "${FILESDIR}"/${P}-python-only-version.patch )

python_compile() {
	MSLK_PYTHON_ONLY=1 MSLK_VERSION=${PV} distutils-r1_python_compile
}

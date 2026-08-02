# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_EXT=1
DISTUTILS_SINGLE_IMPL=1
DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{13..15} )

COMMIT="a8c73356cf12dfb4901405c60715a8597ee93307"

inherit cuda distutils-r1

DESCRIPTION="High-performance Kimi Delta Attention CUDA kernels"
HOMEPAGE="https://github.com/MoonshotAI/FlashKDA"
SRC_URI="https://github.com/MoonshotAI/FlashKDA/archive/${COMMIT}.tar.gz -> ${P}.gh.tar.gz"
S="${WORKDIR}/FlashKDA-${COMMIT}"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

DEPEND="
	dev-util/nvidia-cuda-toolkit
	dev-libs/cutlass
"
RDEPEND="${DEPEND}
	sci-ml/pytorch[${PYTHON_SINGLE_USEDEP}]
"

src_prepare() {
	# The upstream cutlass git submodule is unavailable from a tarball
	# checkout (no .git) and network access is sandboxed; use dev-libs/cutlass
	# instead, whose headers already sit on the default system include path.
	sed -e '/git.*submodule.*update.*--init.*cutlass/d' \
		-e "/os.path.join(this_dir, 'cutlass', /d" \
		-i setup.py || die

	distutils-r1_src_prepare
}

src_compile() {
	cuda_add_sandbox -w
	addpredict /dev/char
	addpredict /proc/self/task
	# No GPU is available in the build sandbox to auto-detect a single
	# target arch, so build all archs upstream supports.
	local -x FLASH_KDA_CUDA_ARCHS=all
	distutils-r1_src_compile
}

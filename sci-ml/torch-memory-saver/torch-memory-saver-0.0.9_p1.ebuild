# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_EXT=1
DISTUTILS_SINGLE_IMPL=1
DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{13..15} )

inherit distutils-r1

EGIT_COMMIT="a193d9dd1b877d33c64a41cfb3db9f867df2d926"

DESCRIPTION="Allow torch tensor memory to be released and resumed later"
HOMEPAGE="https://github.com/fzyzcjy/torch_memory_saver"
SRC_URI="https://github.com/fzyzcjy/torch_memory_saver/archive/${EGIT_COMMIT}.tar.gz -> ${P}.gh.tar.gz"

S="${WORKDIR}/torch_memory_saver-${EGIT_COMMIT}"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE="+cuda rocm"
REQUIRED_USE="|| ( cuda rocm )"
RESTRICT="test"

DEPEND="
	cuda? ( dev-util/nvidia-cuda-toolkit )
	rocm? ( dev-util/hip )
"
RDEPEND="${DEPEND}
	sci-ml/pytorch[${PYTHON_SINGLE_USEDEP}]
	$(python_gen_cond_dep '
		dev-python/numpy[${PYTHON_USEDEP}]
	')
"

src_compile() {
	if use cuda; then
		local cuda_major
		cuda_major=$(nvcc --version | grep -oP 'release \K[0-9]+') || die "Cannot detect CUDA version"
		export TMS_CUDA_MAJOR="${cuda_major}"
	fi
	distutils-r1_src_compile
}

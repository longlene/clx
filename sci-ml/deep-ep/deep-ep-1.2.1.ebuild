# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_EXT=1
DISTUTILS_SINGLE_IMPL=1
DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{13..15} )

inherit distutils-r1

DESCRIPTION="Efficient expert-parallel communication library"
HOMEPAGE="https://github.com/deepseek-ai/DeepEP"
SRC_URI="https://github.com/deepseek-ai/DeepEP/archive/refs/tags/v${PV}.tar.gz -> ${P}.gh.tar.gz"

S="${WORKDIR}/DeepEP-${PV}"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
RESTRICT="test"

RDEPEND="
	sci-ml/pytorch[${PYTHON_SINGLE_USEDEP}]
"
DEPEND="${RDEPEND}"
BDEPEND="
	sci-ml/pytorch[${PYTHON_SINGLE_USEDEP}]
"

python_compile() {
	# Force SM90 (H100/H800) target; intranode.cu uses SM90-only PTX instructions
	TORCH_CUDA_ARCH_LIST="9.0" distutils-r1_python_compile
}

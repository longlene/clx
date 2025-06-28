# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_EXT=1
DISTUTILS_SINGLE_IMPL=1
DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{11..14} )

inherit distutils-r1

CUTLASS_COMMIT="e9627ce55b42fd2599f58cd4396da9380954def0"
FLASH_ATTENTION_COMMIT="3ba6f826b199ff68aa9e9139a46280160defa5cd"

DESCRIPTION="A collection of composable Transformer building blocks"
HOMEPAGE="
	https://pypi.org/project/xformers/
	https://github.com/facebookresearch/xformers
"
SRC_URI="
	https://github.com/facebookresearch/xformers/archive/refs/tags/v${PV}.tar.gz -> ${P}.gh.tar.gz
	https://github.com/NVIDIA/cutlass/archive/${CUTLASS_COMMIT}.tar.gz -> cutlass-${CUTLASS_COMMIT}.gh.tar.gz
	https://github.com/Dao-AILab/flash-attention/archive/${FLASH_ATTENTION_COMMIT}.tar.gz -> flash-attention-${FLASH_ATTENTION_COMMIT}.gh.tar.gz
"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	>=sci-ml/pytorch-2.7.0[${PYTHON_SINGLE_USEDEP}]
	$(python_gen_cond_dep '
		dev-python/numpy[${PYTHON_USEDEP}]
	')
"
#BDEPEND="
#	test? (
#	)
#"

distutils_enable_tests pytest

src_prepare() {
	rmdir third_party/cutlass && ln -sv "${WORKDIR}"/cutlass-${CUTLASS_COMMIT} third_party/cutlass
	rmdir third_party/flash-attention && ln -sv "${WORKDIR}"/flash-attention-${FLASH_ATTENTION_COMMIT} third_party/flash-attention
	distutils-r1_src_prepare
}

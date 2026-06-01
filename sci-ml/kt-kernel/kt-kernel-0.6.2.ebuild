# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_EXT=1
DISTUTILS_SINGLE_IMPL=1
DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{13..14} )

inherit distutils-r1

MY_PN="ktransformers"
MY_P="${MY_PN}-${PV}"

LLAMA_COMMIT="a94e6ff8774b7c9f950d9545baf0ce35e8d1ed2f"

DESCRIPTION="High-performance kernel operations for KTransformers"
HOMEPAGE="
	https://pypi.org/project/kt-kernel/
	https://github.com/kvcache-ai/ktransformers/
"
SRC_URI="
	https://github.com/kvcache-ai/ktransformers/archive/refs/tags/v${PV}.tar.gz -> ${P}.gh.tar.gz
	https://github.com/ggerganov/llama.cpp/archive/${LLAMA_COMMIT}.tar.gz -> llama-cpp-${LLAMA_COMMIT}.tar.gz
"

LICENSE="Apache-2.0"
SLOT="0"
S="${WORKDIR}"/${MY_P}/${PN}
KEYWORDS="~amd64"
IUSE="cuda"

RDEPEND="
	>=sci-ml/pytorch-2.9.1[${PYTHON_SINGLE_USEDEP}]
	$(python_gen_cond_dep '
		>=sci-ml/safetensors-0.4.0[${PYTHON_USEDEP}]
		>=dev-python/numpy-1.24.0[${PYTHON_USEDEP}]
		>=dev-python/triton-2.0.0[${PYTHON_USEDEP}]
		>=dev-python/gguf-0.17.0[${PYTHON_USEDEP}]
		>=dev-python/typer-0.9.0[${PYTHON_USEDEP}]
		>=dev-python/rich-13.0.0[${PYTHON_USEDEP}]
		>=dev-python/pyyaml-6.0[${PYTHON_USEDEP}]
		>=dev-python/httpx-0.25.0[${PYTHON_USEDEP}]
		>=dev-python/packaging-23.0[${PYTHON_USEDEP}]
	')
"
#BDEPEND="
#	test? (
#	)
#"

EPYTEST_PLUGINS=()
distutils_enable_tests pytest

PATCHES=(
	"${FILESDIR}"/build-fix.patch
)

src_prepare() {
	rmdir "${WORKDIR}"/${MY_P}/third_party/llama.cpp && ln -sv "${WORKDIR}"/llama.cpp-${LLAMA_COMMIT} "${WORKDIR}"/${MY_P}/third_party/llama.cpp
	distutils-r1_src_prepare
}

src_configure() {
	export CPUINFER_USE_CUDA=$(usex cuda 1 0)
	distutils-r1_src_configure
}

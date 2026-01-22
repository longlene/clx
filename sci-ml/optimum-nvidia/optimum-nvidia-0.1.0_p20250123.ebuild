# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_SINGLE_IMPL=1
DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{11..13} )

inherit distutils-r1

EGIT_COMMIT="be6957dce3c5e292e6cb2607b064793b83492239"

DESCRIPTION="The interface between the Hugging Face Transformers and NVIDIA GPUs"
HOMEPAGE="
	https://github.com/huggingface/optimum-nvidia
"
SRC_URI="https://github.com/huggingface/optimum-nvidia/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	>=sci-libs/accelerate-0.26.0[${PYTHON_SINGLE_USEDEP}]
	>=sci-libs/optimum-1.21.0[${PYTHON_SINGLE_USEDEP}]
	>=sci-libs/tensorrt-llm-0.16.0[${PYTHON_SINGLE_USEDEP}]
	>=sci-libs/transformers-4.45.1[${PYTHON_SINGLE_USEDEP}]
	>=sci-libs/datasets-2.14.0[${PYTHON_SINGLE_USEDEP}]
	$(python_gen_cond_dep '
		>=sci-libs/pytorch-2.4.0[${PYTHON_USEDEP}]
		>=sci-libs/huggingface_hub-0.24.0[${PYTHON_USEDEP}]
		>=sci-libs/hf-transfer-0.1.6[${PYTHON_USEDEP}]
		sci-libs/mpi4py[${PYTHON_USEDEP}]
		>=sci-libs/mpmath-1.3.0[${PYTHON_USEDEP}]
		>=sci-libs/numpy-1.26.0[${PYTHON_USEDEP}]
		>=sci-libs/onnx-1.17.0[${PYTHON_USEDEP}]
		dev-python/pynvml[${PYTHON_USEDEP}]
	')
"
#BDEPEND="
#	test? (
#	)
#"

distutils_enable_tests pytest

S="${WORKDIR}"/${PN}-${EGIT_COMMIT}

PATCHES=(
	"${FILESDIR}"/cli-fix.patch
)

# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_SINGLE_IMPL=1
DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{13..15} )

inherit distutils-r1

COMMIT="94e4abc5e0c31b67bc1a9d30f1cc34ece28a8756"

DESCRIPTION="Block diffusion for flash speculative decoding"
HOMEPAGE="https://dflash.z-lab.ai https://github.com/z-lab/dflash"
SRC_URI="https://github.com/z-lab/dflash/archive/${COMMIT}.tar.gz -> ${P}.tar.gz"
S="${WORKDIR}/${PN}-${COMMIT}"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE="sglang transformers vllm"
RESTRICT="test"

python_prepare_all() {
	# pyproject.toml lacks [build-system]; inject it so PEP 517 build works
	cat >> pyproject.toml <<-EOF

	[build-system]
	requires = ["setuptools"]
	build-backend = "setuptools.build_meta"
	EOF
	distutils-r1_python_prepare_all
}

RDEPEND="
	sci-ml/datasets[${PYTHON_SINGLE_USEDEP}]
	sci-ml/huggingface_hub[${PYTHON_SINGLE_USEDEP}]
	$(python_gen_cond_dep '
		dev-python/loguru[${PYTHON_USEDEP}]
		dev-python/numpy[${PYTHON_USEDEP}]
		dev-python/requests[${PYTHON_USEDEP}]
		dev-python/rich[${PYTHON_USEDEP}]
		dev-python/tqdm[${PYTHON_USEDEP}]
	')
	sglang? ( sci-ml/sglang[${PYTHON_SINGLE_USEDEP}] )
	transformers? (
		sci-ml/accelerate[${PYTHON_SINGLE_USEDEP}]
		>=sci-ml/pytorch-2.0.0[${PYTHON_SINGLE_USEDEP}]
		>=sci-ml/transformers-4.57.0[${PYTHON_SINGLE_USEDEP}]
		$(python_gen_cond_dep '
			dev-python/typing-extensions[${PYTHON_USEDEP}]
		')
	)
	vllm? ( sci-ml/vllm[${PYTHON_SINGLE_USEDEP}] )
"
DEPEND="${RDEPEND}"

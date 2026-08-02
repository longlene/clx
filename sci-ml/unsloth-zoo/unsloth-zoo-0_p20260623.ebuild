# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_SINGLE_IMPL=1
DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{13..15} )

inherit distutils-r1

EGIT_COMMIT="0abca4bed37c68ca1c81eb964aff04dfc409309f"

DESCRIPTION="Utils for Unsloth"
HOMEPAGE="https://github.com/unslothai/unsloth-zoo"
SRC_URI="https://github.com/unslothai/unsloth-zoo/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"
S="${WORKDIR}"/${PN}-${EGIT_COMMIT}

LICENSE="LGPL-3"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	>=sci-ml/pytorch-2.4.0[${PYTHON_SINGLE_USEDEP}]
	>=sci-ml/torchao-0.13.0[${PYTHON_SINGLE_USEDEP}]
	>=sci-ml/transformers-4.51.3[${PYTHON_SINGLE_USEDEP}]
	>=sci-ml/datasets-3.4.1[${PYTHON_SINGLE_USEDEP}]
	>=sci-ml/accelerate-0.34.1[${PYTHON_SINGLE_USEDEP}]
	>=sci-ml/trl-0.18.2[${PYTHON_SINGLE_USEDEP}]
	>=sci-ml/peft-0.18.0[${PYTHON_SINGLE_USEDEP}]
	>=sci-ml/huggingface_hub-0.34.0[${PYTHON_SINGLE_USEDEP}]
	dev-python/cut-cross-entropy[${PYTHON_SINGLE_USEDEP}]
	$(python_gen_cond_dep '
		>=dev-python/triton-3.0.0[${PYTHON_USEDEP}]
		>=dev-python/packaging-24.1[${PYTHON_USEDEP}]
		dev-python/tyro[${PYTHON_USEDEP}]
		>=sci-ml/sentencepiece-0.2.0[python(+),${PYTHON_USEDEP}]
		dev-python/tqdm[${PYTHON_USEDEP}]
		dev-python/psutil[${PYTHON_USEDEP}]
		>=dev-python/wheel-0.42.0[${PYTHON_USEDEP}]
		dev-python/numpy[${PYTHON_USEDEP}]
		dev-python/protobuf[${PYTHON_USEDEP}]
		dev-python/hf-transfer[${PYTHON_USEDEP}]
		dev-python/pillow[${PYTHON_USEDEP}]
		dev-python/regex[${PYTHON_USEDEP}]
		dev-python/msgspec[${PYTHON_USEDEP}]
		dev-python/typing-extensions[${PYTHON_USEDEP}]
		dev-python/filelock[${PYTHON_USEDEP}]
	')
"

EPYTEST_PLUGINS=()
distutils_enable_tests pytest

src_prepare() {
	rm -rf tests scripts
	distutils-r1_src_prepare
}

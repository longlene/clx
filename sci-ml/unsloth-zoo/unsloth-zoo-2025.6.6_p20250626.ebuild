# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_SINGLE_IMPL=1
DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{11..13} )

inherit distutils-r1

EGIT_COMMIT="76b5e37469254082fca8a211618f87ffb8683056"

DESCRIPTION="Utils for Unsloth"
HOMEPAGE="https://github.com/unslothai/unsloth-zoo"
SRC_URI="https://github.com/unslothai/unsloth-zoo/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="LGPL-3"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	sci-ml/pytorch[${PYTHON_SINGLE_USEDEP}]
	>=sci-ml/transformers-4.46.1[${PYTHON_SINGLE_USEDEP}]
	>=sci-ml/datasets-2.16.0[${PYTHON_SINGLE_USEDEP}]
	>=sci-ml/accelerate-0.34.1[${PYTHON_SINGLE_USEDEP}]
	>=sci-ml/trl-0.7.9[${PYTHON_SINGLE_USEDEP}]
	>=sci-ml/peft-0.7.1[${PYTHON_SINGLE_USEDEP}]
	sci-ml/huggingface_hub[${PYTHON_SINGLE_USEDEP}]
	dev-python/triton-bin[${PYTHON_SINGLE_USEDEP}]
	dev-python/cut-cross-entropy[${PYTHON_SINGLE_USEDEP}]
	$(python_gen_cond_dep '
		>=dev-python/packaging-24.1[${PYTHON_USEDEP}]
		|| (
			>=sci-ml/pysentencepiece-0.2.0[${PYTHON_USEDEP}]
			>=sci-ml/sentencepiece-0.2.0[python,${PYTHON_USEDEP}]
		)
		dev-python/tyro[${PYTHON_USEDEP}]
		dev-python/tqdm[${PYTHON_USEDEP}]
		dev-python/psutil[${PYTHON_USEDEP}]
		>=dev-python/wheel-0.42.0[${PYTHON_USEDEP}]
		dev-python/numpy[${PYTHON_USEDEP}]
		dev-python/protobuf[${PYTHON_USEDEP}]
		dev-python/hf_transfer[${PYTHON_USEDEP}]
		dev-python/pillow[${PYTHON_USEDEP}]
		dev-python/regex[${PYTHON_USEDEP}]
	')
"
BDEPEND=""

distutils_enable_tests pytest

S="${WORKDIR}"/${PN}-${EGIT_COMMIT}

# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_SINGLE_IMPL=1
DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{11..13} )

inherit distutils-r1

EGIT_COMMIT="65b8975c5fb65e6c08726f228877ba6b6601f2ba"

DESCRIPTION="2-5X faster LLM finetuning"
HOMEPAGE="
	https://unsloth.ai/
	https://github.com/unslothai/unsloth
"
SRC_URI="https://github.com/unslothai/unsloth/archive/${EGIT_COMMIT}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	>=sci-ml/unsloth-zoo-2025.3.14[${PYTHON_SINGLE_USEDEP}]
	>=sci-ml/transformers-4.46.1[${PYTHON_SINGLE_USEDEP}]
	>=sci-ml/datasets-2.16.0[${PYTHON_SINGLE_USEDEP}]
	>=sci-ml/accelerate-0.34.1[${PYTHON_SINGLE_USEDEP}]
	>=sci-ml/trl-0.7.9[${PYTHON_SINGLE_USEDEP}]
	>=sci-ml/peft-0.7.1[${PYTHON_SINGLE_USEDEP}]
	$(python_gen_cond_dep '
		dev-python/packaging[${PYTHON_USEDEP}]
		dev-python/tyro[${PYTHON_USEDEP}]
		dev-python/tqdm[${PYTHON_USEDEP}]
		|| (
			>=sci-ml/sentencepiece-0.2.0[python,${PYTHON_USEDEP}]
			>=sci-ml/pysentencepiece-0.2.0[${PYTHON_USEDEP}]
		)
		dev-python/psutil[${PYTHON_USEDEP}]
		>=dev-python/wheel-0.42.0[${PYTHON_USEDEP}]
		dev-python/numpy[${PYTHON_USEDEP}]
		dev-python/protobuf[${PYTHON_USEDEP}]
		dev-python/hf_transfer[${PYTHON_USEDEP}]
		sci-ml/huggingface_hub[${PYTHON_USEDEP}]
		sci-ml/xformers[${PYTHON_USEDEP}]
	')
"
#BDEPEND="
#	test? (
#	)
#"

distutils_enable_tests pytest

S="${WORKDIR}"/${PN}-${EGIT_COMMIT}

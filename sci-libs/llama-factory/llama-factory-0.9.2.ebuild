# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_SINGLE_IMPL=1
DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{11..13} )
inherit distutils-r1

DESCRIPTION="Unified Efficient Fine-Tuning of 100+ LLMs"
HOMEPAGE="https://github.com/hiyouga/LLaMA-Factory"
SRC_URI="https://github.com/hiyouga/LLaMA-Factory/archive/refs/tags/v${PV}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	>=sci-libs/transformers-4.41.2[${PYTHON_SINGLE_USEDEP}]
	>=sci-libs/datasets-2.16.0[${PYTHON_SINGLE_USEDEP}]
	>=sci-libs/accelerate-0.34.0[${PYTHON_SINGLE_USEDEP}]
	>=sci-libs/peft-0.11.1[${PYTHON_SINGLE_USEDEP}]
	>=sci-libs/trl-0.8.6[${PYTHON_SINGLE_USEDEP}]
	>=sci-libs/tokenizers-0.19.0[${PYTHON_SINGLE_USEDEP}]
	$(python_gen_cond_dep '
		>=dev-python/gradio-4.38.0[${PYTHON_USEDEP}]
		>=dev-python/pandas-2.0.0[${PYTHON_USEDEP}]
		dev-python/scipy[${PYTHON_USEDEP}]
		dev-python/einops[${PYTHON_USEDEP}]
		sci-libs/sentencepiece[python,${PYTHON_USEDEP}]
		dev-python/tiktoken[${PYTHON_USEDEP}]
		dev-python/protobuf[${PYTHON_USEDEP}]
		dev-python/uvicorn[${PYTHON_USEDEP}]
		dev-python/pydantic[${PYTHON_USEDEP}]
		dev-python/fastapi[${PYTHON_USEDEP}]
		dev-python/sse-starlette[${PYTHON_USEDEP}]
		>=dev-python/matplotlib-3.7.0[${PYTHON_USEDEP}]
		dev-python/fire[${PYTHON_USEDEP}]
		dev-python/packaging[${PYTHON_USEDEP}]
		dev-python/pyyaml[${PYTHON_USEDEP}]
		dev-python/numpy[${PYTHON_USEDEP}]
		dev-python/av[${PYTHON_USEDEP}]
		dev-python/librosa[${PYTHON_USEDEP}]
		dev-python/tyro[${PYTHON_USEDEP}]
	')
"
#BDEPEND="
#	test? (
#	)
#"

distutils_enable_tests pytest

S="${WORKDIR}"/LLaMA-Factory-${PV}

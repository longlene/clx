# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_SINGLE_IMPL=1
DISTUTILS_USE_PEP517=hatchling
PYTHON_COMPAT=( python3_{11..14} )
inherit distutils-r1

DESCRIPTION="Unified Efficient Fine-Tuning of 100+ LLMs"
HOMEPAGE="https://github.com/hiyouga/LLaMA-Factory"
SRC_URI="https://github.com/hiyouga/LLaMA-Factory/archive/refs/tags/v${PV}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	>=sci-ml/pytorch-2.4.0[${PYTHON_SINGLE_USEDEP}]
    >=sci-ml/torchvision-0.19.0[${PYTHON_SINGLE_USEDEP}]
    >=sci-ml/torchaudio-2.4.0[${PYTHON_SINGLE_USEDEP}]
    >=sci-ml/transformers-4.55.0[${PYTHON_SINGLE_USEDEP}]
    >=sci-ml/datasets-2.16.0[${PYTHON_SINGLE_USEDEP}]
    >=sci-ml/accelerate-1.3.0[${PYTHON_SINGLE_USEDEP}]
    >=sci-ml/peft-0.18.0[${PYTHON_SINGLE_USEDEP}]
    >=sci-ml/trl-0.18.0[${PYTHON_SINGLE_USEDEP}]
    >=sci-ml/torchdata-0.10.0[${PYTHON_SINGLE_USEDEP}]
	>=dev-python/gradio-4.38.0[${PYTHON_SINGLE_USEDEP}]
	$(python_gen_cond_dep '
		>=dev-python/matplotlib-3.7.0[${PYTHON_USEDEP}]
		dev-python/tyro[${PYTHON_USEDEP}]
		dev-python/einops[${PYTHON_USEDEP}]
		dev-python/numpy[${PYTHON_USEDEP}]
		dev-python/pandas[${PYTHON_USEDEP}]
		dev-python/scipy[${PYTHON_USEDEP}]
		sci-ml/sentencepiece[${PYTHON_USEDEP}]
		dev-python/tiktoken[${PYTHON_USEDEP}]
		sci-ml/modelscope[${PYTHON_USEDEP}]
		dev-python/hf-transfer[${PYTHON_USEDEP}]
		sci-ml/safetensors[${PYTHON_USEDEP}]
		>=dev-python/av-10.0.0[${PYTHON_USEDEP}]
		dev-python/fire[${PYTHON_USEDEP}]
		dev-python/omegaconf[${PYTHON_USEDEP}]
		dev-python/packaging[${PYTHON_USEDEP}]
		dev-python/protobuf[${PYTHON_USEDEP}]
		dev-python/pyyaml[${PYTHON_USEDEP}]
		dev-python/pydantic[${PYTHON_USEDEP}]
		dev-python/uvicorn[${PYTHON_USEDEP}]
		dev-python/fastapi[${PYTHON_USEDEP}]
		dev-python/sse-starlette[${PYTHON_USEDEP}]
	')
"
#BDEPEND="
#	test? (
#	)
#"

distutils_enable_tests pytest

S="${WORKDIR}"/LlamaFactory-${PV}

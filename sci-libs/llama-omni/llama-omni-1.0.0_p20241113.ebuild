# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_SINGLE_IMPL=1
DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{11..13} )

inherit distutils-r1

EGIT_COMMIT="544d0ff3de8817fdcbc5192941a11cf4a72cbf2b"

DESCRIPTION="Seamless Speech Interaction with Large Language Models"
HOMEPAGE="https://github.com/ictnlp/LLaMA-Omni"
SRC_URI="https://github.com/ictnlp/LLaMA-Omni/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	>=sci-libs/pytorch-2.1.2[${PYTHON_SINGLE_USEDEP}]
	$(python_gen_cond_dep '
		>=sci-libs/torchvision-0.16.2[${PYTHON_USEDEP}]
		>=sci-libs/torchaudio-2.1.2[${PYTHON_USEDEP}]
		>=sci-libs/transformers-4.43.4[${PYTHON_USEDEP}]
		>=sci-libs/tokenizers-0.19.1[${PYTHON_USEDEP}]
		>=dev-python/sentencepiece-0.1.99[${PYTHON_USEDEP}]
		dev-python/shortuuid[${PYTHON_USEDEP}]
		>=sci-libs/accelerate-0.33.0[${PYTHON_USEDEP}]
		>=sci-libs/peft-0.11.1[${PYTHON_USEDEP}]
		>=dev-python/bitsandbytes-0.43.1[${PYTHON_USEDEP}]
		dev-python/pydantic[${PYTHON_USEDEP}]
		dev-python/markdown2[${PYTHON_USEDEP}]
		dev-python/numpy[${PYTHON_USEDEP}]
		>=dev-python/scikit-learn-1.2.2[${PYTHON_USEDEP}]
		>=dev-python/gradio-4.43.0[${PYTHON_USEDEP}]
		>=dev-python/gradio_client-1.3.0[${PYTHON_USEDEP}]

		dev-python/requests[${PYTHON_USEDEP}]
		>=dev-python/httpx-0.27.2[${PYTHON_USEDEP}]
		dev-python/uvicorn[${PYTHON_USEDEP}]
		dev-python/fastapi[${PYTHON_USEDEP}]
		dev-python/soundfile[${PYTHON_USEDEP}]

		>=dev-python/einops-0.6.1[${PYTHON_USEDEP}]
		>=dev-python/einops-exts-0.0.4[${PYTHON_USEDEP}]
		>=dev-python/timm-0.6.13[${PYTHON_USEDEP}]

		dev-python/openai-whisper[${PYTHON_USEDEP}]
		>=dev-python/omegaconf-2.0.6[${PYTHON_USEDEP}]
	')
"
#BDEPEND="
#	test? (
#	)
#"

distutils_enable_tests pytest

S="${WORKDIR}"/LLaMA-Omni-${EGIT_COMMIT}


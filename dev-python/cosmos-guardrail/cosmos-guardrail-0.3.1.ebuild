# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_SINGLE_IMPL=1
DISTUTILS_USE_PEP517=hatchling
PYTHON_COMPAT=( python3_{13..15} )

inherit distutils-r1 pypi

DESCRIPTION="Guardrail models for the Cosmos world foundation model family"
HOMEPAGE="
	https://pypi.org/project/cosmos-guardrail/
	https://github.com/nvidia-cosmos/cosmos-predict1
"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	>=sci-ml/pytorch-2.6.0[${PYTHON_SINGLE_USEDEP}]
	>=sci-ml/torchvision-0.21.0[${PYTHON_SINGLE_USEDEP}]
	>=sci-ml/transformers-5.0.0[${PYTHON_SINGLE_USEDEP}]
	>=sci-ml/huggingface_hub-0.29.2[${PYTHON_SINGLE_USEDEP}]
	>=sci-ml/peft-0.14.0[${PYTHON_SINGLE_USEDEP}]
	$(python_gen_cond_dep '
		>=sci-ml/safetensors-0.5.3[${PYTHON_USEDEP}]
		sci-ml/sentencepiece[python(+),${PYTHON_USEDEP}]
		>=media-libs/opencv-4.10.0.84[python,${PYTHON_USEDEP}]
		>=dev-python/numpy-1.26.4[${PYTHON_USEDEP}]
		>=dev-python/pillow-11.1.0[${PYTHON_USEDEP}]
		>=dev-python/better-profanity-0.7.0[${PYTHON_USEDEP}]
		>=dev-python/nltk-3.9.1[${PYTHON_USEDEP}]
		dev-python/protobuf[${PYTHON_USEDEP}]
		>=dev-python/attrs-25.1.0[${PYTHON_USEDEP}]
		>=dev-python/tqdm-4.66.5[${PYTHON_USEDEP}]
		>=dev-python/scikit-image-0.25.2[${PYTHON_USEDEP}]
		>=dev-python/requests-2.28.0[${PYTHON_USEDEP}]
		>=dev-python/imageio-2.37.0[${PYTHON_USEDEP}]
		>=dev-python/imageio-ffmpeg-0.4.5[${PYTHON_USEDEP}]
		dev-python/retinaface-py[${PYTHON_USEDEP}]
	')
"

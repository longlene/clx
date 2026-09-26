# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=uv-build
DISTUTILS_SINGLE_IMPL=1
PYTHON_COMPAT=( python3_{13..15} )

inherit distutils-r1

DESCRIPTION="Experimental Hugging Face serving API for Transformers, Diffusers and more"
HOMEPAGE="https://github.com/huggingface/hf-serve"
SRC_URI="https://github.com/huggingface/hf-serve/archive/refs/tags/v${PV}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	>=sci-ml/transformers-5.9.0[${PYTHON_SINGLE_USEDEP}]
	sci-ml/accelerate[${PYTHON_SINGLE_USEDEP}]
	sci-ml/pytorch[${PYTHON_SINGLE_USEDEP}]
	sci-ml/torchvision[${PYTHON_SINGLE_USEDEP}]
	>=sci-ml/diffusers-0.37.0[${PYTHON_SINGLE_USEDEP}]
	sci-ml/kernels[${PYTHON_SINGLE_USEDEP}]
	>=sci-ml/peft-0.14.0[${PYTHON_SINGLE_USEDEP}]
	>=sci-ml/sentence-transformers-5.5.1[${PYTHON_SINGLE_USEDEP}]
	sci-ml/torchaudio[${PYTHON_SINGLE_USEDEP}]
	$(python_gen_cond_dep '
		dev-python/av[${PYTHON_USEDEP}]
		>=dev-python/fastapi-0.115.6[${PYTHON_USEDEP}]
		dev-python/jinja2[${PYTHON_USEDEP}]
		dev-python/jmespath[${PYTHON_USEDEP}]
		dev-python/librosa[${PYTHON_USEDEP}]
		>=dev-python/pandas-2.3.3[${PYTHON_USEDEP}]
		>=dev-python/pillow-11.1.0[${PYTHON_USEDEP}]
		>=dev-python/prometheus-client-0.21.1[${PYTHON_USEDEP}]
		>=dev-python/protobuf-5.29.3[${PYTHON_USEDEP}]
		>=dev-python/pydantic-2.10.5[${PYTHON_USEDEP}]
		>=dev-python/pydub-0.25.0[${PYTHON_USEDEP}]
		>=dev-python/python-magic-0.4.27[${PYTHON_USEDEP}]
		>=dev-python/python-multipart-0.0.20[${PYTHON_USEDEP}]
		>=dev-python/starlette-1.0.1[${PYTHON_USEDEP}]
		>=dev-python/uvicorn-0.34.0[${PYTHON_USEDEP}]
		>=sci-ml/sentencepiece-0.2.0[python(+),${PYTHON_USEDEP}]
		sci-ml/phonemizer[${PYTHON_USEDEP}]
	')
"

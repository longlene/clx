# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_SINGLE_IMPL=1
DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{13..14} )

inherit distutils-r1

DESCRIPTION="Export NeMo/HF models to optimized backends and deploy for inference"
HOMEPAGE="https://github.com/NVIDIA-NeMo/Export-Deploy"
SRC_URI="https://github.com/NVIDIA-NeMo/Export-Deploy/archive/refs/tags/v${PV}.tar.gz
	-> ${P}.gh.tar.gz"
S="${WORKDIR}/Export-Deploy-${PV}"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"
IUSE="vllm"
RESTRICT="test"

RDEPEND="
	sci-ml/megatron-lm[${PYTHON_SINGLE_USEDEP}]
	sci-ml/megatron-bridge[${PYTHON_SINGLE_USEDEP}]
	sci-ml/accelerate[${PYTHON_SINGLE_USEDEP}]
	sci-ml/peft[${PYTHON_SINGLE_USEDEP}]
	>=sci-ml/pytorch-2.6.0[${PYTHON_SINGLE_USEDEP}]
	sci-ml/torchvision[${PYTHON_SINGLE_USEDEP}]
	>=sci-ml/torchmetrics-0.11.0[${PYTHON_SINGLE_USEDEP}]
	sci-ml/lightning[${PYTHON_SINGLE_USEDEP}]
	>=sci-ml/flashinfer-0.2.5[${PYTHON_SINGLE_USEDEP}]
	dev-python/nvidia-resiliency-ext[${PYTHON_SINGLE_USEDEP}]
	$(python_gen_cond_dep '
		dev-python/fastapi[${PYTHON_USEDEP}]
		dev-python/pydantic-settings[${PYTHON_USEDEP}]
		dev-python/uvicorn[${PYTHON_USEDEP}]
		dev-python/cloudpickle[${PYTHON_USEDEP}]
		>=dev-python/omegaconf-2.3.0[${PYTHON_USEDEP}]
		dev-python/wandb[${PYTHON_USEDEP}]
		>=dev-python/pyarrow-20.0.0[${PYTHON_USEDEP}]
		sci-ml/sentencepiece[python(+),${PYTHON_USEDEP}]
		>=dev-python/tiktoken-0.9.0[${PYTHON_USEDEP}]
		dev-python/einops[${PYTHON_USEDEP}]
		dev-python/ijson[${PYTHON_USEDEP}]
		dev-python/pyparsing[${PYTHON_USEDEP}]
		dev-python/fiddle[${PYTHON_USEDEP}]
		dev-python/pillow[${PYTHON_USEDEP}]
	')
	vllm? (
		sci-ml/vllm[${PYTHON_SINGLE_USEDEP}]
		sci-ml/timm[${PYTHON_SINGLE_USEDEP}]
		$(python_gen_cond_dep '
			dev-python/pandas[${PYTHON_USEDEP}]
		')
	)
"
DEPEND="${RDEPEND}"

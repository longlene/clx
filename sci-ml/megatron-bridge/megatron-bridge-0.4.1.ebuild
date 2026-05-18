# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_EXT=1
DISTUTILS_SINGLE_IMPL=1
DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{11..14} )

inherit distutils-r1

DESCRIPTION="Training library for Megatron-based models with bidirectional Hugging Face conversion capability"
HOMEPAGE="
	https://github.com/NVIDIA-NeMo/Megatron-Bridge/
	https://docs.nvidia.com/nemo/megatron-bridge/latest/
"
SRC_URI="https://github.com/NVIDIA-NeMo/Megatron-Bridge/archive/refs/tags/v${PV}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	>=sci-ml/transformers-5.8.1[${PYTHON_SINGLE_USEDEP}]
    >=sci-ml/peft-0.18.1[${PYTHON_SINGLE_USEDEP}]
    >=sci-ml/datasets-2.20.0[${PYTHON_SINGLE_USEDEP}]
    sci-ml/accelerate[${PYTHON_SINGLE_USEDEP}]
    >=sci-ml/diffusers-0.36.0[${PYTHON_SINGLE_USEDEP}]
    >=sci-ml/peft-0.18.0[${PYTHON_SINGLE_USEDEP}]
	>=sci-ml/tensorboard-2.19.0[${PYTHON_SINGLE_USEDEP}]
	sci-ml/megatron-lm[${PYTHON_SINGLE_USEDEP}]
	dev-python/nvidia-resiliency-ext[${PYTHON_SINGLE_USEDEP}]

	sci-ml/timm[${PYTHON_SINGLE_USEDEP}]
	>=sci-ml/pytorch-2.6.0[${PYTHON_SINGLE_USEDEP}]
	sci-ml/flash-linear-attention[${PYTHON_SINGLE_USEDEP}]
	>=sci-ml/flashinfer-0.6.8[${PYTHON_SINGLE_USEDEP}]
	>=sci-ml/open-clip-torch-3.2.0[${PYTHON_SINGLE_USEDEP}]
	$(python_gen_cond_dep '
    	>=dev-python/mistral-common-1.10.0[${PYTHON_USEDEP}]
		dev-python/einops[${PYTHON_USEDEP}]
		dev-python/imageio[${PYTHON_USEDEP}]
		dev-python/imageio-ffmpeg[${PYTHON_USEDEP}]
		>=dev-python/omegaconf-2.3.0[${PYTHON_USEDEP}]
		dev-python/typing-extensions[${PYTHON_USEDEP}]
		dev-python/rich[${PYTHON_USEDEP}]
		>=dev-python/wandb-0.25.0[${PYTHON_USEDEP}]
		>=dev-python/six-1.17.0[${PYTHON_USEDEP}]
		>=dev-python/regex-2024.11.6[${PYTHON_USEDEP}]
		>=dev-python/pyyaml-6.0.2[${PYTHON_USEDEP}]
		>=dev-python/tqdm-4.67.1[${PYTHON_USEDEP}]
		>=dev-python/hydra-1.3[${PYTHON_USEDEP}]
		sci-ml/qwen-vl-utils[${PYTHON_USEDEP}]
		>=dev-python/mlflow-3.9.0[${PYTHON_USEDEP}]
		>=sci-ml/comet-ml-3.50.0[${PYTHON_USEDEP}]
	')
"
BDEPEND="
	$(python_gen_cond_dep '
		dev-python/pybind11[${PYTHON_USEDEP}]
	')

"
#BDEPEND="
#	test? (
#	)
#"

distutils_enable_tests pytest

S="${WORKDIR}"/Megatron-Bridge-${PV}

#src_prepare() {
#	default
#	rm -rf examples scripts tests
#}

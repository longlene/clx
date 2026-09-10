# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_SINGLE_IMPL=1
DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_13 )

inherit distutils-r1

DESCRIPTION="Scalable toolkit for efficient model reinforcement"
HOMEPAGE="
	https://github.com/NVIDIA-NeMo/RL
	https://docs.nvidia.com/nemo/rl/latest/index.html
"
SRC_URI="https://github.com/NVIDIA-NeMo/RL/archive/refs/tags/v${PV}.tar.gz -> ${P}.gh.tar.gz"
S="${WORKDIR}"/RL-${PV}

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	>=sci-ml/pytorch-2.11.0[${PYTHON_SINGLE_USEDEP}]
	dev-python/triton[${PYTHON_SINGLE_USEDEP}]
	>=sci-ml/datasets-4.0.0[${PYTHON_SINGLE_USEDEP}]
	>=sci-ml/accelerate-0.26.0[${PYTHON_SINGLE_USEDEP}]
	sci-ml/tensorboard[${PYTHON_SINGLE_USEDEP}]
	sci-ml/torchdata[${PYTHON_SINGLE_USEDEP}]
	>=sci-ml/torchvision-0.26.0[${PYTHON_SINGLE_USEDEP}]
	>=sci-ml/transformers-5.5.0[${PYTHON_SINGLE_USEDEP}]
	sci-ml/timm[${PYTHON_SINGLE_USEDEP}]
	>=sci-ml/open-clip-torch-3.2.0[${PYTHON_SINGLE_USEDEP}]
	sci-ml/tensordict[${PYTHON_SINGLE_USEDEP}]
	$(python_gen_cond_dep '
		>=dev-python/colored-2.2.3[${PYTHON_USEDEP}]
		>=dev-python/ray-2.55.1[${PYTHON_USEDEP}]
		>=dev-python/wandb-0.28.0[${PYTHON_USEDEP}]
		dev-python/numpy[${PYTHON_USEDEP}]
		dev-python/rich[${PYTHON_USEDEP}]
		dev-python/math-verify[${PYTHON_USEDEP}]
		dev-python/omegaconf[${PYTHON_USEDEP}]
		dev-python/nvidia-ml-py[${PYTHON_USEDEP}]
		dev-python/hydra-core[${PYTHON_USEDEP}]
		dev-python/tiktoken[${PYTHON_USEDEP}]
		sci-ml/sentencepiece[${PYTHON_USEDEP}]
		dev-python/blobfile[${PYTHON_USEDEP}]
		dev-python/debugpy[${PYTHON_USEDEP}]
		dev-python/nvtx[${PYTHON_USEDEP}]
		dev-python/matplotlib[${PYTHON_USEDEP}]
		dev-python/plotly[${PYTHON_USEDEP}]
		>=dev-python/sympy-1.14.0[${PYTHON_USEDEP}]
		>=dev-python/pillow-12.3.0[${PYTHON_USEDEP}]
		>=dev-python/num2words-0.5.14[${PYTHON_USEDEP}]
		>=dev-python/mlflow-3.13.0[${PYTHON_USEDEP}]
		dev-libs/nvshmem[python,${PYTHON_USEDEP}]
		dev-python/swanlab[${PYTHON_USEDEP}]
		dev-python/pyzmq[${PYTHON_USEDEP}]
		>=dev-python/soundfile-0.13.1[${PYTHON_USEDEP}]
		dev-python/nccl4py[${PYTHON_USEDEP}]
		dev-python/cuda-bindings[${PYTHON_USEDEP}]
		dev-python/pybase64[${PYTHON_USEDEP}]
		dev-python/nvidia-cudnn[${PYTHON_USEDEP}]
		dev-python/tilelang[${PYTHON_USEDEP}]
		dev-python/transferqueue[${PYTHON_USEDEP}]
		sci-ml/mooncake-transfer-engine[${PYTHON_USEDEP}]
	')
"
#BDEPEND="
#	test? (
#	)
#"

distutils_enable_tests pytest

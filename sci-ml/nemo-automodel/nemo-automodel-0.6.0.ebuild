# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_SINGLE_IMPL=1
DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{13..15} )

inherit distutils-r1

DESCRIPTION="Pytorch Distributed native training library for LLMs/VLMs with OOTB Hugging"
HOMEPAGE="
	https://github.com/NVIDIA-NeMo/Automodel
	https://docs.nvidia.com/nemo/automodel/latest/index.html
"
SRC_URI="https://github.com/NVIDIA-NeMo/Automodel/archive/refs/tags/v${PV}.tar.gz -> ${P}.gh.tar.gz"
S="${WORKDIR}"/Automodel-${PV}

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	>=sci-ml/datasets-4.0.0[${PYTHON_SINGLE_USEDEP}]
	>=sci-ml/megatron-fsdp-0.5.0[${PYTHON_SINGLE_USEDEP}]
	>=sci-ml/pytorch-2.6.0[${PYTHON_SINGLE_USEDEP}]
	sci-ml/torchdata[${PYTHON_SINGLE_USEDEP}]
	>=sci-ml/transformers-5.12.1[${PYTHON_SINGLE_USEDEP}]
	sci-ml/torchao[${PYTHON_SINGLE_USEDEP}]
	>=sci-ml/flashoptim-0.1.3[${PYTHON_SINGLE_USEDEP}]
	>=sci-ml/quack-kernels-0.6.1[${PYTHON_SINGLE_USEDEP}]
	$(python_gen_cond_dep '
		dev-python/mistral-common[${PYTHON_USEDEP}]
		dev-python/pybind11[${PYTHON_USEDEP}]
		dev-python/pyyaml[${PYTHON_USEDEP}]
		dev-python/tiktoken[${PYTHON_USEDEP}]
		>=dev-python/wandb-0.28.0[${PYTHON_USEDEP}]
		dev-python/mlflow[${PYTHON_USEDEP}]
	')
"
#BDEPEND="
#	test? (
#	)
#"

distutils_enable_tests pytest

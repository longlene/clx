# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_SINGLE_IMPL=1
DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{13..14} )

inherit distutils-r1

COMMIT="d717a3ea7aa8961697493b33337af9a05ebc1f0d"

DESCRIPTION="PyTorch native library for training speculative decoding models"
HOMEPAGE="https://github.com/lightseekorg/TorchSpec"
SRC_URI="https://github.com/lightseekorg/TorchSpec/archive/${COMMIT}.tar.gz -> ${P}.gh.tar.gz"

S="${WORKDIR}/TorchSpec-${COMMIT}"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE="vllm"
RESTRICT="test"

RDEPEND="
	sci-ml/pytorch[${PYTHON_SINGLE_USEDEP}]
	sci-ml/transformers[${PYTHON_SINGLE_USEDEP}]
	sci-ml/accelerate[${PYTHON_SINGLE_USEDEP}]
	sci-ml/datasets[${PYTHON_SINGLE_USEDEP}]
	$(python_gen_cond_dep '
		dev-python/tqdm[${PYTHON_USEDEP}]
		dev-python/wandb[${PYTHON_USEDEP}]
		sci-ml/qwen-vl-utils[${PYTHON_USEDEP}]
		dev-python/psutil[${PYTHON_USEDEP}]
		<dev-python/numpy-2.4[${PYTHON_USEDEP}]
		dev-python/pydantic[${PYTHON_USEDEP}]
		dev-python/openai-harmony[${PYTHON_USEDEP}]
		dev-python/cmake[${PYTHON_USEDEP}]
		dev-python/ninja[${PYTHON_USEDEP}]
		dev-python/packaging[${PYTHON_USEDEP}]
		dev-python/pyzmq[${PYTHON_USEDEP}]
		dev-python/openai[${PYTHON_USEDEP}]
		dev-python/omegaconf[${PYTHON_USEDEP}]
		dev-python/ray[${PYTHON_USEDEP}]
		dev-python/numba[${PYTHON_USEDEP}]
	')
	vllm? ( >=sci-ml/vllm-0.18.0 )
"

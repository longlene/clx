# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_SINGLE_IMPL=1
DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{13..15} )

inherit distutils-r1

DESCRIPTION="Scalable generative AI framework for researchers and developers"
HOMEPAGE="
	https://github.com/NVIDIA-NeMo/Speech
	https://github.com/NVIDIA-NeMo/NeMo
"
SRC_URI="https://github.com/NVIDIA-NeMo/Speech/archive/refs/tags/v${PV}.tar.gz -> ${P}.gh.tar.gz"
S="${WORKDIR}/Speech-${PV}"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	>=sci-ml/pytorch-2.6.0[${PYTHON_SINGLE_USEDEP}]
	>=sci-ml/huggingface_hub-0.24[${PYTHON_SINGLE_USEDEP}]
	sci-ml/tensorboard[${PYTHON_SINGLE_USEDEP}]
	$(python_gen_cond_dep '
		dev-python/aistore[${PYTHON_USEDEP}]
		>=dev-python/fsspec-2024.12.0[${PYTHON_USEDEP}]
		dev-python/cuda-bindings[${PYTHON_USEDEP}]
		>=dev-python/numpy-1.22[${PYTHON_USEDEP}]
		>=sci-ml/onnx-1.7.0[${PYTHON_USEDEP}]
		dev-python/scikit-learn[${PYTHON_USEDEP}]
		dev-python/smart-open[${PYTHON_USEDEP}]
		dev-python/text-unidecode[${PYTHON_USEDEP}]
		>=dev-python/tqdm-4.41.0[${PYTHON_USEDEP}]
		dev-python/wrapt[${PYTHON_USEDEP}]
	')
"
#BDEPEND="
#	test? (
#	)
#"

distutils_enable_tests pytest

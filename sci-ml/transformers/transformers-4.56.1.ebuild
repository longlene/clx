# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_SINGLE_IMPL=1
DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{11..14} )
inherit distutils-r1

DESCRIPTION="State-of-the-art Machine Learning for JAX, PyTorch and TensorFlow"
HOMEPAGE="
	https://pypi.org/project/transformers/
	https://huggingface.co/
"
SRC_URI="https://github.com/huggingface/${PN}/archive/refs/tags/v${PV}.tar.gz
	-> ${P}.gh.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"
IUSE="torch"

RESTRICT="test"

RDEPEND="
	>=sci-ml/huggingface_hub-0.34.0[${PYTHON_SINGLE_USEDEP}]
	=sci-ml/tokenizers-0.21*[${PYTHON_SINGLE_USEDEP}]
	$(python_gen_cond_dep '
		dev-python/filelock[${PYTHON_USEDEP}]
		>=dev-python/numpy-1.17[${PYTHON_USEDEP}]
		>=dev-python/packaging-20.0[${PYTHON_USEDEP}]
		>=dev-python/pyyaml-5.1[${PYTHON_USEDEP}]
		dev-python/regex[${PYTHON_USEDEP}]
		dev-python/requests[${PYTHON_USEDEP}]
		>=dev-python/tqdm-4.27.0[${PYTHON_USEDEP}]
		>=sci-ml/safetensors-0.4.3[${PYTHON_USEDEP}]
	')
	torch? (
		>=sci-ml/accelerate-0.26.0[${PYTHON_SINGLE_USEDEP}]
		sci-ml/caffe2[${PYTHON_SINGLE_USEDEP}]
		sci-ml/pytorch[${PYTHON_SINGLE_USEDEP}]
	)
"

distutils_enable_tests import-check

# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_SINGLE_IMPL=1
DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{11..14} )

inherit distutils-r1

DESCRIPTION="NVIDIA NeMo Framework"
HOMEPAGE="
	https://github.com/NVIDIA-NeMo/NeMo/
	https://docs.nvidia.com/nemo-framework/user-guide/latest/overview.html
"
SRC_URI="https://github.com/NVIDIA-NeMo/NeMo/archive/refs/tags/v${PV}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	>=sci-ml/huggingface_hub-0.24.0[${PYTHON_SINGLE_USEDEP}]
	sci-ml/tensorboard[${PYTHON_SINGLE_USEDEP}]
	sci-ml/pytorch[${PYTHON_SINGLE_USEDEP}]
	$(python_gen_cond_dep '
		>=dev-python/fsspec-2024.12.0[${PYTHON_USEDEP}]
		dev-python/numba[${PYTHON_USEDEP}]
		>=dev-python/numpy-1.22[${PYTHON_USEDEP}]
		>=sci-ml/onnx-1.7.0[${PYTHON_USEDEP}]
		>=dev-python/protobuf-5.29.5[${PYTHON_USEDEP}]
		dev-python/python-dateutil[${PYTHON_USEDEP}]
		dev-python/ruamel-yaml[${PYTHON_USEDEP}]
		dev-python/scikit-learn[${PYTHON_USEDEP}]
		>=dev-python/setuptools-70.0.0[${PYTHON_USEDEP}]
		dev-python/text-unidecode[${PYTHON_USEDEP}]
		>=dev-python/tqdm-4.41.0[${PYTHON_USEDEP}]
		dev-python/wget[${PYTHON_USEDEP}]
		dev-python/wrapt[${PYTHON_USEDEP}]
	')
"
#BDEPEND="
#	test? (
#	)
#"

distutils_enable_tests pytest

S="${WORKDIR}"/NeMo-${PV}

src_prepare() {
	default
	rm -rf examples scripts tests
}

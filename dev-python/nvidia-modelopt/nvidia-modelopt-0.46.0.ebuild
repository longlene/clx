# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_SINGLE_IMPL=1
DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{13..14} )

inherit distutils-r1

DESCRIPTION="A unified library of SOTA model optimization techniques like quantization"
HOMEPAGE="
	https://pypi.org/project/nvidia-modelopt/
	https://github.com/NVIDIA/Model-Optimizer
"
SRC_URI="https://github.com/NVIDIA/Model-Optimizer/archive/refs/tags/${PV}.tar.gz -> ${P}.gh.tar.gz"
S="${WORKDIR}/Model-Optimizer-${PV}"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	>=sci-ml/pytorch-2.8[${PYTHON_SINGLE_USEDEP}]
	$(python_gen_cond_dep '
		dev-python/ninja[${PYTHON_USEDEP}]
		dev-python/numpy[${PYTHON_USEDEP}]
		>=dev-python/nvidia-ml-py-12[${PYTHON_USEDEP}]
		dev-python/packaging[${PYTHON_USEDEP}]
		dev-python/tqdm[${PYTHON_USEDEP}]
		>=dev-python/pyyaml-6.0[${PYTHON_USEDEP}]
		>=dev-python/omegaconf-2.3.0[${PYTHON_USEDEP}]
		<dev-python/pulp-4.0[${PYTHON_USEDEP}]
		>=dev-python/pydantic-2.0[${PYTHON_USEDEP}]
		dev-python/regex[${PYTHON_USEDEP}]
		dev-python/rich[${PYTHON_USEDEP}]
		sci-ml/safetensors[${PYTHON_USEDEP}]
		dev-python/scipy[${PYTHON_USEDEP}]
	')
"
BDEPEND="$(python_gen_cond_dep 'dev-python/setuptools-scm[${PYTHON_USEDEP}]')"

RESTRICT="test"

src_prepare() {
	export SETUPTOOLS_SCM_PRETEND_VERSION=${PV}
	distutils-r1_src_prepare
}

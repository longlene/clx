# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_SINGLE_IMPL=1
DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{13..15} )

inherit distutils-r1

DESCRIPTION="Scalable data pre-processing and curation toolkit for LLMs"
HOMEPAGE="https://github.com/NVIDIA-NeMo/Curator https://docs.nvidia.com/nemo-framework/user-guide/latest/datacuration/index.html"
SRC_URI="https://github.com/NVIDIA-NeMo/Curator/archive/refs/tags/v${PV}.tar.gz -> ${P}.gh.tar.gz"

S="${WORKDIR}/Curator-${PV}"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"
IUSE="cuda"
RESTRICT="test"

RDEPEND="
	sci-ml/pytorch[${PYTHON_SINGLE_USEDEP}]
	sci-ml/transformers[${PYTHON_SINGLE_USEDEP}]
	$(python_gen_cond_dep '
		>=dev-python/absl-py-2.0.0[${PYTHON_USEDEP}]
		dev-python/comment-parser[${PYTHON_USEDEP}]
		dev-python/cosmos-xenna[${PYTHON_USEDEP}]
		dev-python/fsspec[${PYTHON_USEDEP}]
		dev-python/hydra-core[${PYTHON_USEDEP}]
		>=dev-python/jieba-0.42.1[${PYTHON_USEDEP}]
		dev-python/loguru[${PYTHON_USEDEP}]
		dev-python/mecab-python:3[${PYTHON_USEDEP}]
		dev-python/omegaconf[${PYTHON_USEDEP}]
		>=dev-python/openai-1.0.0[${PYTHON_USEDEP}]
		>=dev-python/pandas-2.1.0[${PYTHON_USEDEP}]
		dev-python/pyarrow[${PYTHON_USEDEP}]
		>=dev-python/ray-2.54[${PYTHON_USEDEP}]
		cuda? (
			dev-python/nvidia-ml-py[${PYTHON_USEDEP}]
		)
	')
"

src_prepare() {
	# Prevent git subprocess call for version suffix in offline sandbox
	export NO_VCS_VERSION=1
	distutils-r1_src_prepare
}

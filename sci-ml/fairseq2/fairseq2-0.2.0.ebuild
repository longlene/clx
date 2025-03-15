# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_SINGLE_IMPL=1
DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{11..13} )

inherit distutils-r1

DESCRIPTION="FAIR Sequence Modeling Toolkit 2"
HOMEPAGE="https://github.com/facebookresearch/fairseq2"
SRC_URI="https://github.com/facebookresearch/fairseq2/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND="
"
RDEPEND="${DEPEND}
	media-libs/libsndfile
	$(python_gen_cond_dep '
		>=dev-python/editdistance-0.8[${PYTHON_USEDEP}]
		dev-python/fairseq2n[${PYTHON_USEDEP}]
		>=dev-python/importlib-metadata-7.0[${PYTHON_USEDEP}]
		>=dev-python/importlib-resources-6.4[${PYTHON_USEDEP}]
		>=dev-python/mypy-extensions-1.0[${PYTHON_USEDEP}]
		>=dev-python/numpy-1.23[${PYTHON_USEDEP}]
		>=dev-python/packaging-24.1[${PYTHON_USEDEP}]
		>=dev-python/psutil-5.9[${PYTHON_USEDEP}]
		>=dev-python/pyyaml-6.0[${PYTHON_USEDEP}]
		>=dev-python/rich-13.7[${PYTHON_USEDEP}]
		>=dev-python/sacrebleu-2.4[${PYTHON_USEDEP}]
		>=dev-python/tiktoken-0.7[${PYTHON_USEDEP}]
		>=sci-ml/torcheval-0.0.6[${PYTHON_USEDEP}]
		>=dev-python/tqdm-4.62[${PYTHON_USEDEP}]
		>=dev-python/typing_extensions-4.12[${PYTHON_USEDEP}]
		>=dev-python/blobfile-3.0.0[${PYTHON_USEDEP}]
	')
"
BDEPEND=""

RESTRICT="test"

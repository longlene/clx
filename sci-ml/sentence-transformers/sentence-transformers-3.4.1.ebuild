# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_SINGLE_IMPL=1
DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{11..13} )

inherit distutils-r1

DESCRIPTION="State-of-the-Art Text Embeddings"
HOMEPAGE="
	https://www.sbert.net/
	https://github.com/UKPLab/sentence-transformers
"
SRC_URI="https://github.com/UKPLab/sentence-transformers/archive/refs/tags/v${PV}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}
	>=sci-ml/transformers-4.41[${PYTHON_SINGLE_USEDEP}]
	$(python_gen_cond_dep '
		>=sci-ml/pytorch-1.11.0[${PYTHON_USEDEP}]
		dev-python/tqdm[${PYTHON_USEDEP}]
		dev-python/scikit-learn[${PYTHON_USEDEP}]
		dev-python/scipy[${PYTHON_USEDEP}]
		>=sci-ml/huggingface_hub-0.20.0[${PYTHON_USEDEP}]
		dev-python/pillow[${PYTHON_USEDEP}]
	')
"
BDEPEND=""

RESTRICT="test"

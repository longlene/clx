# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_SINGLE_IMPL=1
DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{11..14} )

inherit distutils-r1

DESCRIPTION="A library for easily evaluating machine learning models and datasets"
HOMEPAGE="
	https://pypi.org/project/evaluate/
	https://github.com/huggingface/evaluate/
"
SRC_URI="https://github.com/huggingface/evaluate/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	>=sci-ml/datasets-2.0.0[${PYTHON_SINGLE_USEDEP}]
	>=sci-ml/huggingface_hub-0.7.0[${PYTHON_SINGLE_USEDEP}]
	$(python_gen_cond_dep '
		>=dev-python/numpy-1.17[${PYTHON_USEDEP}]
		dev-python/dill[${PYTHON_USEDEP}]
		dev-python/pandas[${PYTHON_USEDEP}]
		>=dev-python/requests-2.19.0[${PYTHON_USEDEP}]
		>=dev-python/tqdm-4.62.1[${PYTHON_USEDEP}]
		dev-python/xxhash[${PYTHON_USEDEP}]
		dev-python/multiprocess[${PYTHON_USEDEP}]
		>=dev-python/fsspec-2021.05.0[${PYTHON_USEDEP}]
		dev-python/packaging[${PYTHON_USEDEP}]
	')
"
BDEPEND="
	test? (
		$(python_gen_cond_dep '
			dev-python/pytest-datadir[${PYTHON_USEDEP}]
			dev-python/pytest-xdist[${PYTHON_USEDEP}]
		')
	)
"

distutils_enable_tests pytest

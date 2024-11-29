# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_SINGLE_IMPL=1
DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{11..13} )

inherit distutils-r1

DESCRIPTION="HuggingFace library to process and filter large amounts of webdata"
HOMEPAGE="https://github.com/huggingface/datatrove"
SRC_URI="https://github.com/huggingface/datatrove/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	$(python_gen_cond_dep '
		>=dev-python/dill-0.3.0[${PYTHON_USEDEP}]
		>=dev-python/fsspec-2023.12.2[${PYTHON_USEDEP}]
		>=dev-python/huggingface-hub-0.17.0[${PYTHON_USEDEP}]
		dev-python/humanize[${PYTHON_USEDEP}]
		>=dev-python/loguru-0.7.0[${PYTHON_USEDEP}]
		dev-python/multiprocess[${PYTHON_USEDEP}]
		>=dev-python/numpy-1.25.0[${PYTHON_USEDEP}]
		dev-python/tqdm[${PYTHON_USEDEP}]
	')
"
BDEPEND=""

RESTRICT="test"

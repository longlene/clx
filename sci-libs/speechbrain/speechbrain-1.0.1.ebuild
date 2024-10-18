# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12..13} )

inherit distutils-r1

DESCRIPTION="All-in-one speech toolkit in pure Python and Pytorch"
HOMEPAGE="https://github.com/speechbrain/speechbrain"
SRC_URI="https://github.com/speechbrain/speechbrain/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	>=dev-python/huggingface_hub-0.8.0[${PYTHON_USEDEP}]
	>=dev-python/hyperpyyaml-0.0.1[${PYTHON_USEDEP}]
	>=dev-python/joblib-0.14.1[${PYTHON_USEDEP}]
	>=dev-python/numpy-1.17.0[${PYTHON_USEDEP}]
	dev-python/packaging[${PYTHON_USEDEP}]
	>=dev-python/pandas-1.0.1[${PYTHON_USEDEP}]
	>=dev-python/pre-commit-2.3.0[${PYTHON_USEDEP}]
	>=dev-python/pygtrie-2.1[${PYTHON_USEDEP}]
	>=dev-python/scipy-1.4.1[${PYTHON_USEDEP}]
	>=dev-python/sentencepiece-0.1.91[${PYTHON_USEDEP}]
	>=sci-libs/pytorch-1.9.0[${PYTHON_USEDEP}]
	>=dev-python/torchaudio-1.9.0[${PYTHON_USEDEP}]
	>=dev-python/tqdm-4.42.0[${PYTHON_USEDEP}]
	>=dev-python/transformers-4.30.0[${PYTHON_USEDEP}]
"
#BDEPEND="
#	test? (
#	)
#"

distutils_enable_tests pytest

# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12..13} )

inherit distutils-r1

DESCRIPTION="The deep learning framework to pretrain, finetune and deploy AI models"
HOMEPAGE="https://github.com/Lightning-AI/pytorch-lightning"
SRC_URI="https://github.com/Lightning-AI/pytorch-lightning/archive/refs/tags/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	>=dev-python/pytorch-2.1.0[${PYTHON_USEDEP}]
	>=dev-python/tqdm-4.57.0[${PYTHON_USEDEP}]
	>=dev-python/pyyaml-5.4[${PYTHON_USEDEP}]
	>=dev-python/fsspec-2022.5.0[${PYTHON_USEDEP}]
	>=dev-python/torchmetrics-0.7.0[${PYTHON_USEDEP}]
	>=dev-python/packaging-20.0[${PYTHON_USEDEP}]
	>=dev-python/typing-extensions-4.4.0[${PYTHON_USEDEP}]
	>=dev-python/lightning-utilities-0.10.0[${PYTHON_USEDEP}]
"
#BDEPEND="
#	test? (
#	)
#"
#
#distutils_enable_tests pytest

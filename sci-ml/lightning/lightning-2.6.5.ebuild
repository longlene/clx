# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_SINGLE_IMPL=1
DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{13..15} )

inherit distutils-r1

DESCRIPTION="Framework to pretrain, finetune and deploy AI models"
HOMEPAGE="https://github.com/Lightning-AI/pytorch-lightning https://lightning.ai"
SRC_URI="https://github.com/Lightning-AI/pytorch-lightning/archive/refs/tags/${PV}.tar.gz -> ${P}.gh.tar.gz"

S="${WORKDIR}/pytorch-lightning-${PV}"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"
RESTRICT="test"

REQUIRED_USE="${PYTHON_REQUIRED_USE}"

RDEPEND="
	${PYTHON_DEPS}
	sci-ml/pytorch[${PYTHON_SINGLE_USEDEP}]
	sci-ml/torchmetrics[${PYTHON_SINGLE_USEDEP}]
	$(python_gen_cond_dep '
		>=dev-python/fsspec-2022.5.0[${PYTHON_USEDEP}]
		>=dev-python/packaging-23.0[${PYTHON_USEDEP}]
		>=dev-python/pyyaml-5.4[${PYTHON_USEDEP}]
		>=dev-python/tqdm-4.57.0[${PYTHON_USEDEP}]
		>=dev-python/typing-extensions-4.4.0[${PYTHON_USEDEP}]
		>=sci-ml/lightning-utilities-0.10.0[${PYTHON_USEDEP}]
	')
"
BDEPEND="${PYTHON_DEPS}"

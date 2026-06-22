# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_SINGLE_IMPL=1
DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{13..15} )

inherit distutils-r1

DESCRIPTION="General multi-task deep RL Agent"
HOMEPAGE="https://github.com/huggingface/jat"
SRC_URI="https://github.com/huggingface/jat/archive/834b49c0ea28ba27cd7e0283a73b7c4f852ef622.tar.gz -> ${P}.gh.tar.gz"

S="${WORKDIR}/jat-834b49c0ea28ba27cd7e0283a73b7c4f852ef622"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"
RESTRICT="test"

python_prepare_all() {
	# Upstream passes include as a bare string instead of a list, causing
	# find_packages() to iterate characters and pick up the tests/ package
	sed -i -e 's|include="jat\*"|include=["jat*"]|' setup.py || die
	distutils-r1_python_prepare_all
}

RDEPEND="
	>=sci-ml/accelerate-0.25.0[${PYTHON_SINGLE_USEDEP}]
	>=sci-ml/datasets-2.15.0[${PYTHON_SINGLE_USEDEP}]
	>=sci-ml/huggingface_hub-0.10[${PYTHON_SINGLE_USEDEP}]
	>=sci-ml/pytorch-2.1.1[${PYTHON_SINGLE_USEDEP}]
	sci-ml/torchvision[${PYTHON_SINGLE_USEDEP}]
	>=sci-ml/transformers-4.36.1[${PYTHON_SINGLE_USEDEP}]
	$(python_gen_cond_dep '
		sci-ml/gymnasium[${PYTHON_USEDEP}]
		dev-python/numpy[${PYTHON_USEDEP}]
		media-libs/opencv[python,${PYTHON_USEDEP}]
		dev-python/wandb[${PYTHON_USEDEP}]
	')
"

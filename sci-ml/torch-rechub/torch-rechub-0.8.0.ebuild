# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=hatchling
PYTHON_COMPAT=( python3_{13..15} )

inherit distutils-r1

DESCRIPTION="Lighting Pytorch Framework for Recommendation Models"
HOMEPAGE="https://github.com/datawhalechina/torch-rechub"
SRC_URI="https://github.com/datawhalechina/torch-rechub/archive/refs/tags/v${PV}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE="annoy bigdata faiss generative tracking visualization"
RESTRICT="test"

RDEPEND="
	dev-python/numpy[${PYTHON_USEDEP}]
	dev-python/pandas[${PYTHON_USEDEP}]
	dev-python/tqdm[${PYTHON_USEDEP}]
	dev-python/scikit-learn[${PYTHON_USEDEP}]
	>=sci-ml/pytorch-1.10.0[${PYTHON_USEDEP}]
	annoy? ( dev-python/annoy[${PYTHON_USEDEP}] )
	bigdata? ( dev-python/pyarrow[${PYTHON_USEDEP}] )
	faiss? ( sci-ml/faiss[${PYTHON_USEDEP}] )
	generative? (
		sci-ml/accelerate[${PYTHON_USEDEP}]
		sci-ml/transformers[${PYTHON_USEDEP}]
	)
	tracking? (
		dev-python/tensorboardx[${PYTHON_USEDEP}]
		dev-python/wandb[${PYTHON_USEDEP}]
	)
	visualization? (
		dev-python/graphviz[${PYTHON_USEDEP}]
		dev-python/torchview[${PYTHON_USEDEP}]
	)
"

# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_SINGLE_IMPL=1
DISTUTILS_USE_PEP517=hatchling
PYTHON_COMPAT=( python3_{13..15} )

inherit distutils-r1

DESCRIPTION="High-level library for training and evaluating neural networks in PyTorch"
HOMEPAGE="https://pytorch-ignite.ai https://github.com/pytorch/ignite"
SRC_URI="https://github.com/pytorch/ignite/archive/refs/tags/v${PV}.tar.gz -> ${P}.gh.tar.gz"

S="${WORKDIR}/ignite-${PV}"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64"
IUSE="tensorboard tqdm"
RESTRICT="test"

RDEPEND="
	>=sci-ml/pytorch-2.2[${PYTHON_SINGLE_USEDEP}]
	tensorboard? ( sci-ml/tensorboard[${PYTHON_SINGLE_USEDEP}] )
	$(python_gen_cond_dep '
		dev-python/packaging[${PYTHON_USEDEP}]
		tqdm? ( dev-python/tqdm[${PYTHON_USEDEP}] )
	')
"

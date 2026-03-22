# Copyright 2026 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_SINGLE_IMPL=1
DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{11..14} )

inherit distutils-r1

DESCRIPTION="A PyTorch native platform for training generative AI models"
HOMEPAGE="
	https://github.com/pytorch/torchtitan
"
SRC_URI="https://github.com/pytorch/torchtitan/archive/refs/tags/v${PV}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="BSD-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	>=sci-ml/torchdata-0.8.0[${PYTHON_SINGLE_USEDEP}]
	>=sci-ml/datasets-3.6.0[${PYTHON_SINGLE_USEDEP}]
	>=sci-ml/tokenizers-0.15.0[${PYTHON_SINGLE_USEDEP}]
	sci-ml/tensorboard[${PYTHON_SINGLE_USEDEP}]
	$(python_gen_cond_dep '
		sci-ml/safetensors[${PYTHON_USEDEP}]
		dev-python/fsspec[${PYTHON_USEDEP}]
		dev-python/tyro[${PYTHON_USEDEP}]
		dev-python/wandb[${PYTHON_USEDEP}]
		dev-python/einops[${PYTHON_USEDEP}]
		dev-python/pillow[${PYTHON_USEDEP}]
	')
"

RESTRICT="test"

# Copyright 2023-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_SINGLE_IMPL=1
DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{10..13} )

inherit distutils-r1

DESCRIPTION="ControlNet auxiliary models"
HOMEPAGE="
	https://github.com/huggingface/controlnet_aux
"
SRC_URI="https://github.com/huggingface/controlnet_aux/archive/refs/tags/v${PV}.tar.gz
	-> ${P}.gh.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	sci-libs/pytorch[${PYTHON_SINGLE_USEDEP}]
	sci-libs/torchvision[${PYTHON_SINGLE_USEDEP}]
	sci-libs/timm[${PYTHON_SINGLE_USEDEP}]
	$(python_gen_cond_dep '
		dev-python/pillow[${PYTHON_USEDEP}]
		dev-python/numpy[${PYTHON_USEDEP}]
		dev-python/filelock[${PYTHON_USEDEP}]
		dev-python/importlib-metadata[${PYTHON_USEDEP}]
		media-libs/opencv[${PYTHON_USEDEP}]
		dev-python/scipy[${PYTHON_USEDEP}]
		sci-libs/huggingface_hub[${PYTHON_USEDEP}]
		dev-python/einops[${PYTHON_USEDEP}]
		dev-python/scikit-image[${PYTHON_USEDEP}]
	')
"

RESTRICT="test"

S="${WORKDIR}"/controlnet_aux-${PV}

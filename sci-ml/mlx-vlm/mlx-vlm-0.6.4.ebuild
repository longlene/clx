# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_SINGLE_IMPL=1
DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{13..15} )

inherit distutils-r1

DESCRIPTION="A package for inference and fine-tuning of Vision Language Models and Omni"
HOMEPAGE="https://github.com/Blaizzy/mlx-vlm"
SRC_URI="
	https://github.com/Blaizzy/mlx-vlm/archive/refs/tags/v${PV}.tar.gz -> ${P}.gh.tar.gz
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE="cuda ui"

RDEPEND="
	>=sci-ml/transformers-5.5.0[${PYTHON_SINGLE_USEDEP}]
	>=sci-ml/datasets-2.19.1[${PYTHON_SINGLE_USEDEP}]
	>=sci-ml/mlx-lm-0.31.3[${PYTHON_SINGLE_USEDEP}]
	>=sci-ml/mlx-audio-0.4.3[${PYTHON_SINGLE_USEDEP}]
	ui? ( dev-python/gradio[${PYTHON_SINGLE_USEDEP}] )
	$(python_gen_cond_dep '
		sci-ml/mlx[cuda?,${PYTHON_USEDEP}]
		>=dev-python/miniaudio-1.59[${PYTHON_USEDEP}]
		>=dev-python/tqdm-4.66.2[${PYTHON_USEDEP}]
		>=dev-python/pillow-10.3.0[${PYTHON_USEDEP}]
		>=dev-python/requests-2.31.0[${PYTHON_USEDEP}]
		>=sci-ml/llguidance-1.7.0[${PYTHON_USEDEP}]
		>=media-libs/opencv-4.12.0[python,${PYTHON_USEDEP}]
		>=dev-python/fastapi-0.95.1[${PYTHON_USEDEP}]
		>=dev-python/starlette-1.0.1[${PYTHON_USEDEP}]
		>=dev-python/python-multipart-0.0.9[${PYTHON_USEDEP}]
		dev-python/uvicorn[${PYTHON_USEDEP}]
		dev-python/numpy[${PYTHON_USEDEP}]
	')
"
RESTRICT="test"

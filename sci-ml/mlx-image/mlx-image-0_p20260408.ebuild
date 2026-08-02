# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_SINGLE_IMPL=1
DISTUTILS_USE_PEP517=hatchling
PYTHON_COMPAT=( python3_{13..15} )

inherit distutils-r1

MY_COMMIT="da92532ad036bcc5e971d161a63b27616e63de6e"

DESCRIPTION="Apple MLX image models library"
HOMEPAGE="https://github.com/riccardomusmeci/mlx-image"
SRC_URI="https://github.com/riccardomusmeci/mlx-image/archive/${MY_COMMIT}.tar.gz -> ${P}.gh.tar.gz"

S="${WORKDIR}/mlx-image-${MY_COMMIT}"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
RESTRICT="test"

RDEPEND="
	>=sci-ml/huggingface_hub-0.23[${PYTHON_SINGLE_USEDEP}]
	$(python_gen_cond_dep '
		>=dev-python/matplotlib-3.9[${PYTHON_USEDEP}]
		>=dev-python/numpy-2.0[${PYTHON_USEDEP}]
		>=media-libs/opencv-4.10:0[python(+),${PYTHON_USEDEP}]
		>=dev-python/pandas-2.2[${PYTHON_USEDEP}]
		>=dev-python/pillow-12.1.1[${PYTHON_USEDEP}]
		>=dev-python/tqdm-4.66[${PYTHON_USEDEP}]
		>=sci-ml/albumentations-2.0[${PYTHON_USEDEP}]
		>=sci-ml/mlx-0.31.0[${PYTHON_USEDEP}]
		>=sci-ml/safetensors-0.4[${PYTHON_USEDEP}]
	')
"

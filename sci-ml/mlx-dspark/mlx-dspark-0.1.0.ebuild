# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_SINGLE_IMPL=1
DISTUTILS_USE_PEP517=hatchling
PYTHON_COMPAT=( python3_{13..15} )

inherit distutils-r1

DESCRIPTION="DSpark and DFlash speculative decoding for Apple Silicon via MLX"
HOMEPAGE="https://github.com/ARahim3/mlx-dspark"
SRC_URI="https://github.com/ARahim3/mlx-dspark/archive/refs/tags/v${PV}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

RESTRICT="test"

RDEPEND="
	>=sci-ml/mlx-lm-0.31.3[${PYTHON_SINGLE_USEDEP}]
	>=sci-ml/mlx-vlm-0.6.3[${PYTHON_SINGLE_USEDEP}]
	sci-ml/huggingface_hub[${PYTHON_SINGLE_USEDEP}]
	$(python_gen_cond_dep '
		>=sci-ml/mlx-0.31.2[${PYTHON_USEDEP}]
		dev-python/numpy[${PYTHON_USEDEP}]
	')
"

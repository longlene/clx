# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_SINGLE_IMPL=1
DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{13..15} )

inherit distutils-r1

COMMIT="786a9c9ec454ae5a33ce815316f49ffa19aa162e"

DESCRIPTION="Exact speculative decoding on Apple Silicon, powered by MLX"
HOMEPAGE="https://github.com/Aryagm/dflash-mlx"
SRC_URI="https://github.com/Aryagm/dflash-mlx/archive/${COMMIT}.tar.gz -> ${P}.tar.gz"
S="${WORKDIR}/${PN}-${COMMIT}"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE="charts"
RESTRICT="test"

RDEPEND="
	sci-ml/datasets[${PYTHON_SINGLE_USEDEP}]
	sci-ml/huggingface_hub[${PYTHON_SINGLE_USEDEP}]
	sci-ml/mlx-lm[${PYTHON_SINGLE_USEDEP}]
	$(python_gen_cond_dep '
		sci-ml/mlx[${PYTHON_USEDEP}]
		dev-python/numpy[${PYTHON_USEDEP}]
		charts? ( dev-python/matplotlib[${PYTHON_USEDEP}] )
	')
"
DEPEND="${RDEPEND}"

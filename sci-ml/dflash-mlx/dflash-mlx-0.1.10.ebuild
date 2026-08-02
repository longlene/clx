# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_SINGLE_IMPL=1
DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{13..15} )

inherit distutils-r1

DESCRIPTION="DFlash speculative decoding for Apple Silicon via MLX"
HOMEPAGE="https://github.com/bstnxbt/dflash-mlx"
SRC_URI="https://github.com/bstnxbt/dflash-mlx/archive/refs/tags/v${PV}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"
IUSE="bench"
RESTRICT="test"

RDEPEND="
	$(python_gen_cond_dep '
		>=sci-ml/mlx-0.31.0[${PYTHON_USEDEP}]
	')
	>=sci-ml/mlx-lm-0.31.0[${PYTHON_SINGLE_USEDEP}]
	bench? ( sci-ml/datasets[${PYTHON_SINGLE_USEDEP}] )
"

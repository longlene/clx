# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_SINGLE_IMPL=1
DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{13..15} )

inherit distutils-r1 pypi

DESCRIPTION="Mixed-precision quantization optimizer for LLMs on Apple Silicon (MLX)"
HOMEPAGE="https://pypi.org/project/mlx-optiq/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

# mlx-lm and huggingface_hub are single-impl; list at top level without
# Python USE constraints per the multi/single-impl boundary rule
RDEPEND="
	>=sci-ml/mlx-lm-0.31.3
	sci-ml/huggingface_hub
	$(python_gen_cond_dep '
		>=sci-ml/mlx-0.20[python,${PYTHON_USEDEP}]
		dev-python/numpy[${PYTHON_USEDEP}]
		dev-python/scipy[${PYTHON_USEDEP}]
		>=sci-ml/lm-format-enforcer-0.10[${PYTHON_USEDEP}]
	')
"

RESTRICT="test"

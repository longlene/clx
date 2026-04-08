# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_SINGLE_IMPL=1
DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12..14} )

inherit distutils-r1

DESCRIPTION="Run LLMs with MLX"
HOMEPAGE="https://github.com/ml-explore/mlx-lm"
SRC_URI="
	https://github.com/ml-explore/mlx-lm/archive/refs/tags/v${PV}.tar.gz -> ${P}.gh.tar.gz
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

RDEPEND="
	>=sci-ml/transformers-5.0.0[${PYTHON_SINGLE_USEDEP}]
	$(python_gen_cond_dep '
		sci-ml/mlx[python,${PYTHON_USEDEP}]
		dev-python/numpy[${PYTHON_USEDEP}]
		sci-ml/sentencepiece[${PYTHON_USEDEP}]
		dev-python/protobuf[${PYTHON_USEDEP}]
		dev-python/pyyaml[${PYTHON_USEDEP}]
		dev-python/jinja2[${PYTHON_USEDEP}]
	')
"
#BDEPEND="
#	test? (
#	)
#"
#
#distutils_enable_tests pytest

RESTRICT="test"


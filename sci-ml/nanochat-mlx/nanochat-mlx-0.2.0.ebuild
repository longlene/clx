# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_SINGLE_IMPL=1
DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{13..15} )

inherit distutils-r1

DESCRIPTION="MLX port of nanochat — train your own ChatGPT on Apple Silicon"
HOMEPAGE="https://github.com/scasella/nanochat-mlx"
SRC_URI="https://github.com/scasella/nanochat-mlx/archive/refs/tags/v${PV}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE="convert"

RESTRICT="test"

src_prepare() {
	# pyproject.toml has no [build-system] section; inject setuptools backend
	cat >> pyproject.toml <<-'EOF'

	[build-system]
	requires = ["setuptools"]
	build-backend = "setuptools.build_meta"

	[tool.setuptools.packages.find]
	include = ["nanochat_mlx*"]
	EOF
	distutils-r1_src_prepare
}

RDEPEND="
	sci-ml/huggingface_hub[${PYTHON_SINGLE_USEDEP}]
	sci-ml/tokenizers[${PYTHON_SINGLE_USEDEP}]
	>=sci-ml/transformers-4.36.0[${PYTHON_SINGLE_USEDEP}]
	sci-ml/datasets[${PYTHON_SINGLE_USEDEP}]
	$(python_gen_cond_dep '
		sci-ml/mlx[python,${PYTHON_USEDEP}]
		dev-python/fastapi[${PYTHON_USEDEP}]
		dev-python/numpy[${PYTHON_USEDEP}]
		dev-python/pyarrow[${PYTHON_USEDEP}]
		dev-python/regex[${PYTHON_USEDEP}]
		dev-python/requests[${PYTHON_USEDEP}]
		dev-python/rustbpe[${PYTHON_USEDEP}]
		dev-python/scipy[${PYTHON_USEDEP}]
		dev-python/tabulate[${PYTHON_USEDEP}]
		dev-python/tiktoken[${PYTHON_USEDEP}]
		dev-python/uvicorn[${PYTHON_USEDEP}]
		convert? ( sci-ml/pytorch[${PYTHON_USEDEP}] )
	')
"

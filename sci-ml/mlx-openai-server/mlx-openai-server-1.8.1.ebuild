# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_SINGLE_IMPL=1
DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{13..15} )

inherit distutils-r1

DESCRIPTION="OpenAI-compatible API server providing endpoints for MLX models"
HOMEPAGE="https://github.com/cubist38/mlx-openai-server"
SRC_URI="https://github.com/cubist38/mlx-openai-server/archive/refs/tags/v${PV}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
RESTRICT="test"

RDEPEND="
	>=sci-ml/mlx-embeddings-0.0.5[${PYTHON_SINGLE_USEDEP}]
	>=sci-ml/mlx-lm-0.31.3[${PYTHON_SINGLE_USEDEP}]
	>=sci-ml/mlx-vlm-0.4.4[${PYTHON_SINGLE_USEDEP}]
	>=sci-ml/mlx-whisper-0.4.3[${PYTHON_SINGLE_USEDEP}]
	>=sci-ml/outlines-1.1.1[${PYTHON_SINGLE_USEDEP}]
	>=sci-ml/torchvision-0.23.0[${PYTHON_SINGLE_USEDEP}]
	>=sci-ml/mflux-0.17.4[${PYTHON_SINGLE_USEDEP}]
	$(python_gen_cond_dep '
		>=dev-python/aiofiles-25[${PYTHON_USEDEP}]
		>=dev-python/av-16.0.1[${PYTHON_USEDEP}]
		>=dev-python/click-8.2.1[${PYTHON_USEDEP}]
		>=dev-python/dill-0.4[${PYTHON_USEDEP}]
		>=dev-python/fastapi-0.115.14[${PYTHON_USEDEP}]
		>=dev-python/httpx2-0.28[${PYTHON_USEDEP}]
		>=dev-python/json-repair-0.52.1[${PYTHON_USEDEP}]
		>=dev-python/librosa-0.11.0[${PYTHON_USEDEP}]
		>=dev-python/loguru-0.7.3[${PYTHON_USEDEP}]
		>=dev-python/numpy-2.2.0[${PYTHON_USEDEP}]
		>=dev-python/openai-2.21[${PYTHON_USEDEP}]
		>=dev-python/openai-harmony-0.0.8[${PYTHON_USEDEP}]
		>=dev-python/pillow-12.1.1[${PYTHON_USEDEP}]
		>=dev-python/pydantic-2[${PYTHON_USEDEP}]
		>=dev-python/python-multipart-0.0.20[${PYTHON_USEDEP}]
		>=dev-python/pyyaml-6.0[${PYTHON_USEDEP}]
		>=dev-python/rich-14[${PYTHON_USEDEP}]
		>=dev-python/uvicorn-0.35.0[${PYTHON_USEDEP}]
		>=dev-python/xxhash-3.6[${PYTHON_USEDEP}]
		>=sci-ml/mlx-0.31.2[${PYTHON_USEDEP}]
	')
"

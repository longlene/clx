# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_SINGLE_IMPL=1
DISTUTILS_USE_PEP517=hatchling
PYTHON_COMPAT=( python3_{13..15} )

inherit distutils-r1

DESCRIPTION="OpenAI-compatible API server using Apple MLX for on-device inference"
HOMEPAGE="https://github.com/madroidmaq/mlx-omni-server"
SRC_URI="https://github.com/madroidmaq/mlx-omni-server/archive/refs/tags/v${PV}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
RESTRICT="test"

	#>=sci-ml/outlines-1.0.4[${PYTHON_SINGLE_USEDEP}]
RDEPEND="
	>=sci-ml/mlx-lm-0.31.2[${PYTHON_SINGLE_USEDEP}]
	>=sci-ml/mlx-vlm-0.4.3[${PYTHON_SINGLE_USEDEP}]
	>=sci-ml/mlx-audio-0.4.3[${PYTHON_SINGLE_USEDEP}]
	>=sci-ml/mlx-whisper-0.4.1[${PYTHON_SINGLE_USEDEP}]
	>=sci-ml/mlx-embeddings-0.0.3[${PYTHON_SINGLE_USEDEP}]
	$(python_gen_cond_dep '
	>=dev-python/fastapi-0.117.0[${PYTHON_USEDEP}]
	>=dev-python/pydantic-2.9.2[${PYTHON_USEDEP}]
	>=dev-python/uvicorn-0.34.0[${PYTHON_USEDEP}]
	>=dev-python/rich-13.9.4[${PYTHON_USEDEP}]
	>=dev-python/python-multipart-0.0.27[${PYTHON_USEDEP}]
	>=dev-python/sse-starlette-2.1.3[${PYTHON_USEDEP}]
	>=dev-python/numba-0.57.0[${PYTHON_USEDEP}]
	>=dev-python/misaki-0.9.4[${PYTHON_USEDEP}]
	>=sci-ml/mlx-0.31.2[${PYTHON_USEDEP}]
	>=sci-ml/transformers-5.5.0[${PYTHON_USEDEP}]
	>=sci-ml/huggingface_hub-0.30.0[${PYTHON_USEDEP}]
	>=sci-ml/f5-tts-mlx-0.2.5[${PYTHON_USEDEP}]
	>=sci-ml/mflux-0.17.5[${PYTHON_USEDEP}]
	')
"

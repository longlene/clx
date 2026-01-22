# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_SINGLE_IMPL=1
DISTUTILS_USE_PEP517=hatchling
PYTHON_COMPAT=( python3_{11..14} )

inherit distutils-r1

DESCRIPTION="A TTS that fits in your CPU"
HOMEPAGE="
	https://github.com/kyutai-labs/pocket-tts
"
SRC_URI="https://github.com/kyutai-labs/pocket-tts/archive/refs/tags/v${PV}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}
	>=sci-libs/pytorch-2.5.0[${PYTHON_SINGLE_USEDEP}]
	>=sci-libs/hugging_hub-0.10.0[${PYTHON_SINGLE_USEDEP}]
	$(python_gen_cond_dep '
		>=dev-python/beartype-0.22.5[${PYTHON_USEDEP}]
		>=dev-python/numpy-2.0.0[${PYTHON_USEDEP}]
		>=dev-python/pydantic-2.0.0[${PYTHON_USEDEP}]
		>=sci-ml/sentencepiece-0.2.1[${PYTHON_USEDEP}]
		>=sci-ml/safetensors-0.4.0[${PYTHON_USEDEP}]
		>=dev-python/typer-0.10.0[${PYTHON_USEDEP}]
		>=dev-python/type-extensions-4.0.0[${PYTHON_USEDEP}]
		>=dev-python/fastapi-0.100[${PYTHON_USEDEP}]
		>=dev-python/uvicorn-0.13.0[${PYTHON_USEDEP}]
		>=dev-python/python-multipart-0.0.21[${PYTHON_USEDEP}]
		>=dev-python/scipy-1.5.0[${PYTHON_USEDEP}]
		>=dev-python/einops-0.4.0[${PYTHON_USEDEP}]
		>=dev-python/requests-2.20.0[${PYTHON_USEDEP}]
	')
"
BDEPEND=""

EPYTEST_PLUGINS=()
distutils_enable_tests pytest

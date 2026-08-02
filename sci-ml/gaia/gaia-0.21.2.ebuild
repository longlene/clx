# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_SINGLE_IMPL=1
DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{13..15} )

inherit distutils-r1

DESCRIPTION="Lightweight agent framework designed for the edge and AI PCs"
HOMEPAGE="https://github.com/amd/gaia"
SRC_URI="https://github.com/amd/gaia/archive/refs/tags/v${PV}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE="api audio litellm mcp rag talk telegram ui"
RESTRICT="test"

RDEPEND="
	sci-ml/accelerate[${PYTHON_SINGLE_USEDEP}]
	sci-ml/transformers[${PYTHON_SINGLE_USEDEP}]
	audio? (
		>=sci-ml/pytorch-2.0.0[${PYTHON_SINGLE_USEDEP}]
		sci-ml/torchaudio[${PYTHON_SINGLE_USEDEP}]
		sci-ml/torchvision[${PYTHON_SINGLE_USEDEP}]
	)
	litellm? ( >=dev-python/litellm-1.35.0[${PYTHON_SINGLE_USEDEP}] )
	rag? ( sci-ml/sentence-transformers[${PYTHON_SINGLE_USEDEP}] )
	ui? (
		>=sci-ml/pytorch-2.0.0[${PYTHON_SINGLE_USEDEP}]
		sci-ml/sentence-transformers[${PYTHON_SINGLE_USEDEP}]
	)
	$(python_gen_cond_dep '
		dev-python/aiohttp[${PYTHON_USEDEP}]
		dev-python/beautifulsoup4[${PYTHON_USEDEP}]
		>=dev-python/keyring-24.0.0[${PYTHON_USEDEP}]
		dev-python/openai[${PYTHON_USEDEP}]
		>=dev-python/pillow-9.0.0[${PYTHON_USEDEP}]
		>=dev-python/pydantic-2.9.2[${PYTHON_USEDEP}]
		dev-python/python-dotenv[${PYTHON_USEDEP}]
		>=dev-python/python-multipart-0.0.9[${PYTHON_USEDEP}]
		dev-python/requests[${PYTHON_USEDEP}]
		dev-python/rich[${PYTHON_USEDEP}]
		>=dev-python/tavily-python-0.5.0[${PYTHON_USEDEP}]
		>=dev-python/watchdog-2.1.0[${PYTHON_USEDEP}]
		api? (
			>=dev-python/fastapi-0.115.0[${PYTHON_USEDEP}]
			>=dev-python/uvicorn-0.32.0[${PYTHON_USEDEP}]
		)
		mcp? (
			>=dev-python/mcp-1.1.0[${PYTHON_USEDEP}]
			dev-python/starlette[${PYTHON_USEDEP}]
			dev-python/uvicorn[${PYTHON_USEDEP}]
		)
		rag? (
			sci-ml/faiss[python,${PYTHON_USEDEP}]
			dev-python/numpy[${PYTHON_USEDEP}]
			dev-python/pymupdf[${PYTHON_USEDEP}]
			dev-python/pypdf[${PYTHON_USEDEP}]
			dev-python/python-pptx[${PYTHON_USEDEP}]
		)
		talk? (
			dev-python/psutil[${PYTHON_USEDEP}]
			dev-python/sounddevice[${PYTHON_USEDEP}]
			dev-python/soundfile[${PYTHON_USEDEP}]
		)
		telegram? ( >=dev-python/python-telegram-bot-20.3[${PYTHON_USEDEP}] )
		ui? (
			sci-ml/faiss[python,${PYTHON_USEDEP}]
			>=dev-python/fastapi-0.115.0[${PYTHON_USEDEP}]
			dev-python/httpx[${PYTHON_USEDEP}]
			dev-python/numpy[${PYTHON_USEDEP}]
			dev-python/psutil[${PYTHON_USEDEP}]
			dev-python/pymupdf[${PYTHON_USEDEP}]
			dev-python/pypdf[${PYTHON_USEDEP}]
			dev-python/python-pptx[${PYTHON_USEDEP}]
			sci-ml/safetensors[${PYTHON_USEDEP}]
			>=dev-python/uvicorn-0.32.0[${PYTHON_USEDEP}]
		)
	')
"

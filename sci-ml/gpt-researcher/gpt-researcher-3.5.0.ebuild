# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_SINGLE_IMPL=1
DISTUTILS_USE_PEP517=poetry
PYTHON_COMPAT=( python3_{13..15} )

inherit distutils-r1

DESCRIPTION="Autonomous agent for comprehensive deep research using LLMs"
HOMEPAGE="https://github.com/assafelovic/gpt-researcher https://gptr.dev"
SRC_URI="https://github.com/assafelovic/gpt-researcher/archive/refs/tags/v${PV}.tar.gz
	-> ${P}.gh.tar.gz"
S="${WORKDIR}/gpt-researcher-${PV}"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"
RESTRICT="test"

RDEPEND="
	sci-misc/litellm[${PYTHON_SINGLE_USEDEP}]
	sci-ml/huggingface_hub[${PYTHON_SINGLE_USEDEP}]
	$(python_gen_cond_dep '
		dev-python/aiofiles[${PYTHON_USEDEP}]
		dev-python/aiohttp[${PYTHON_USEDEP}]
		>=dev-python/beautifulsoup4-4.12.2[${PYTHON_USEDEP}]
		dev-python/colorama[${PYTHON_USEDEP}]
		dev-python/cryptography[${PYTHON_USEDEP}]
		>=dev-python/fastapi-0.104.1[${PYTHON_USEDEP}]
		dev-python/feedparser[${PYTHON_USEDEP}]
		dev-python/filelock[${PYTHON_USEDEP}]
		dev-python/httpx[${PYTHON_USEDEP}]
		>=dev-python/jinja2-3.1.2[${PYTHON_USEDEP}]
		dev-python/json-repair[${PYTHON_USEDEP}]
		dev-python/json5[${PYTHON_USEDEP}]
		sci-ml/langchain[${PYTHON_USEDEP}]
		sci-ml/langchain-classic[${PYTHON_USEDEP}]
		sci-ml/langchain-community[${PYTHON_USEDEP}]
		sci-ml/langchain-core[${PYTHON_USEDEP}]
		sci-ml/langchain-openai[${PYTHON_USEDEP}]
		sci-ml/langchain-text-splitters[${PYTHON_USEDEP}]
		sci-ml/langgraph[${PYTHON_USEDEP}]
		dev-python/langsmith[${PYTHON_USEDEP}]
		dev-python/loguru[${PYTHON_USEDEP}]
		>=dev-python/lxml-4.9.2[${PYTHON_USEDEP}]
		dev-python/lxml-html-clean[${PYTHON_USEDEP}]
		>=dev-python/markdown-3.5.1[${PYTHON_USEDEP}]
		dev-python/mcp[${PYTHON_USEDEP}]
		dev-python/mistune[${PYTHON_USEDEP}]
		dev-python/nltk[${PYTHON_USEDEP}]
		>=dev-python/numpy-2.0.0[${PYTHON_USEDEP}]
		>=dev-python/openai-1.3.3[${PYTHON_USEDEP}]
		dev-python/ollama[${PYTHON_USEDEP}]
		dev-python/packaging[${PYTHON_USEDEP}]
		>=dev-python/pillow-11.2.1[${PYTHON_USEDEP}]
		>=dev-python/primp-0.15.0[${PYTHON_USEDEP}]
		dev-python/psutil[${PYTHON_USEDEP}]
		>=dev-python/pydantic-2.5.1[${PYTHON_USEDEP}]
		dev-python/pymupdf[${PYTHON_USEDEP}]
		dev-python/pypdf[${PYTHON_USEDEP}]
		dev-python/python-docx[${PYTHON_USEDEP}]
		>=dev-python/python-dotenv-1.0.0[${PYTHON_USEDEP}]
		dev-python/python-magic[${PYTHON_USEDEP}]
		>=dev-python/python-multipart-0.0.6[${PYTHON_USEDEP}]
		>=dev-python/pyyaml-6.0.1[${PYTHON_USEDEP}]
		dev-python/regex[${PYTHON_USEDEP}]
		>=dev-python/requests-2.31.0[${PYTHON_USEDEP}]
		dev-python/six[${PYTHON_USEDEP}]
		>=dev-python/sqlalchemy-2.0.28[${PYTHON_USEDEP}]
		dev-python/starlette[${PYTHON_USEDEP}]
		dev-python/tenacity[${PYTHON_USEDEP}]
		>=dev-python/tiktoken-0.7.0[${PYTHON_USEDEP}]
		dev-python/tqdm[${PYTHON_USEDEP}]
		dev-python/typing-extensions[${PYTHON_USEDEP}]
		dev-python/unstructured[${PYTHON_USEDEP}]
		dev-python/urllib3[${PYTHON_USEDEP}]
		>=dev-python/uvicorn-0.24.0[${PYTHON_USEDEP}]
		>=dev-python/weasyprint-65.1[${PYTHON_USEDEP}]
		>=dev-python/websockets-13.1[${PYTHON_USEDEP}]
	')
"

# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=pdm-backend
DISTUTILS_SINGLE_IMPL=1
PYTHON_COMPAT=( python3_{13..15} )

inherit distutils-r1

DESCRIPTION="AI research assistant with deep iterative analysis using LLMs and web searches"
HOMEPAGE="https://github.com/LearningCircuit/local-deep-research https://pypi.org/project/local-deep-research/"

SRC_URI="https://github.com/LearningCircuit/local-deep-research/archive/refs/tags/v${PV}.tar.gz -> ${P}.gh.tar.gz"

S="${WORKDIR}/${P}"
LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	$(python_gen_cond_dep '
		dev-python/alembic[${PYTHON_USEDEP}]
		dev-python/apprise[${PYTHON_USEDEP}]
		dev-python/apscheduler[${PYTHON_USEDEP}]
		dev-python/aiohttp[${PYTHON_USEDEP}]
		dev-python/beautifulsoup4[${PYTHON_USEDEP}]
		dev-python/cachetools[${PYTHON_USEDEP}]
		dev-python/cryptography[${PYTHON_USEDEP}]
		dev-python/click[${PYTHON_USEDEP}]
		dev-python/defusedxml[${PYTHON_USEDEP}]
		dev-python/dynaconf[${PYTHON_USEDEP}]
		dev-python/elasticsearch[${PYTHON_USEDEP}]
		dev-python/flask[${PYTHON_USEDEP}]
		dev-python/flask-cors[${PYTHON_USEDEP}]
		dev-python/flask-limiter[${PYTHON_USEDEP}]
		dev-python/flask-login[${PYTHON_USEDEP}]
		dev-python/flask-socketio[${PYTHON_USEDEP}]
		dev-python/flask-wtf[${PYTHON_USEDEP}]
		dev-python/jaraco-context[${PYTHON_USEDEP}]
		dev-python/langchain-ollama[${PYTHON_USEDEP}]
		dev-python/lxml[${PYTHON_USEDEP}]
		dev-python/markdown[${PYTHON_USEDEP}]
		dev-python/methodtools[${PYTHON_USEDEP}]
		dev-python/msoffcrypto-tool[${PYTHON_USEDEP}]
		dev-python/nh3[${PYTHON_USEDEP}]
		dev-python/openai[${PYTHON_USEDEP}]
		dev-python/openpyxl[${PYTHON_USEDEP}]
		dev-python/optuna[${PYTHON_USEDEP}]
		dev-python/pandas[${PYTHON_USEDEP}]
		dev-python/pdfplumber[${PYTHON_USEDEP}]
		dev-python/plotly[${PYTHON_USEDEP}]
		dev-python/platformdirs[${PYTHON_USEDEP}]
		dev-python/pyarrow[${PYTHON_USEDEP}]
		dev-python/pydantic[${PYTHON_USEDEP}]
		dev-python/pydantic-settings[${PYTHON_USEDEP}]
		dev-python/pypdf[${PYTHON_USEDEP}]
		dev-python/python-dateutil[${PYTHON_USEDEP}]
		dev-python/python-docx[${PYTHON_USEDEP}]
		dev-python/python-pptx[${PYTHON_USEDEP}]
		dev-python/requests[${PYTHON_USEDEP}]
		dev-python/rich[${PYTHON_USEDEP}]
		dev-python/sqlalchemy[${PYTHON_USEDEP}]
		dev-python/tiktoken[${PYTHON_USEDEP}]
		dev-python/toml[${PYTHON_USEDEP}]
		dev-python/tenacity[${PYTHON_USEDEP}]
		dev-python/trafilatura[${PYTHON_USEDEP}]
		dev-python/typing-extensions[${PYTHON_USEDEP}]
		dev-python/urllib3[${PYTHON_USEDEP}]
		dev-python/weasyprint[${PYTHON_USEDEP}]
		dev-python/werkzeug[${PYTHON_USEDEP}]
		dev-python/wikipedia[${PYTHON_USEDEP}]
		dev-python/xlrd[${PYTHON_USEDEP}]
		dev-python/xmltodict[${PYTHON_USEDEP}]
		dev-python/pillow[${PYTHON_USEDEP}]
		sci-ml/langchain[${PYTHON_USEDEP}]
		sci-ml/langchain-anthropic[${PYTHON_USEDEP}]
		sci-ml/langchain-community[${PYTHON_USEDEP}]
		sci-ml/langchain-core[${PYTHON_USEDEP}]
		sci-ml/langchain-experimental[${PYTHON_USEDEP}]
		sci-ml/langchain-openai[${PYTHON_USEDEP}]
	')
	sci-ml/crawl4ai[${PYTHON_SINGLE_USEDEP}]
	sci-ml/sentence-transformers[${PYTHON_SINGLE_USEDEP}]
	sci-ml/datasets[${PYTHON_SINGLE_USEDEP}]
"

distutils_enable_tests pytest

# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_SINGLE_IMPL=1
DISTUTILS_USE_PEP517=hatchling
PYTHON_COMPAT=( python3_{13..15} )

inherit distutils-r1

DESCRIPTION="User-friendly AI Interface"
HOMEPAGE="
	https://pypi.org/project/open-webui/
	https://github.com/open-webui/open-webui
"
SRC_URI="https://github.com/open-webui/open-webui/archive/refs/tags/v${PV}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	>=sci-ml/transformers-5.5.4[${PYTHON_SINGLE_USEDEP}]
	>=sci-ml/sentence-transformers-5.5.1[${PYTHON_SINGLE_USEDEP}]
	>=sci-ml/accelerate-1.13.0[${PYTHON_SINGLE_USEDEP}]
	>=sci-ml/faster-whisper-1.2.1[${PYTHON_SINGLE_USEDEP}]
	$(python_gen_cond_dep '
		>=dev-python/fastapi-0.136.3[${PYTHON_USEDEP}]
		>=dev-python/uvicorn-0.41.0[${PYTHON_USEDEP}]
		>=dev-python/pydantic-2.13.4[${PYTHON_USEDEP}]
		>=dev-python/python-multipart-0.0.27[${PYTHON_USEDEP}]
		>=dev-python/itsdangerous-2.2.0[${PYTHON_USEDEP}]
		>=dev-python/python-socketio-5.16.2[${PYTHON_USEDEP}]
		>=dev-python/python-jose-3.5.0[${PYTHON_USEDEP}]
		>=dev-python/cryptography-48.0.0[${PYTHON_USEDEP}]
		>=dev-python/bcrypt-5.0.0[${PYTHON_USEDEP}]
		>=dev-python/argon2-cffi-25.1.0[${PYTHON_USEDEP}]
		>=dev-python/pyjwt-2.13.0[${PYTHON_USEDEP}]
		>=dev-python/authlib-1.7.2[${PYTHON_USEDEP}]
		>=dev-python/requests-2.34.2[${PYTHON_USEDEP}]
		>=dev-python/aiohttp-3.13.5[${PYTHON_USEDEP}]
		>=dev-python/async-timeout-5.0.1[${PYTHON_USEDEP}]
		>=dev-python/aiocache-0.12.3[${PYTHON_USEDEP}]
		>=dev-python/aiofiles-25.1.0[${PYTHON_USEDEP}]
		>=dev-python/starlette-compress-1.7.1[${PYTHON_USEDEP}]
		>=app-arch/brotli-1.2.0[python,${PYTHON_USEDEP}]
		>=dev-python/brotlicffi-1.2.0.1[${PYTHON_USEDEP}]
		>=dev-python/starsessions-2.2.1[${PYTHON_USEDEP}]
		>=dev-python/python-mimeparse-2.0.0[${PYTHON_USEDEP}]
		>=dev-python/sqlalchemy-2.0.50[${PYTHON_USEDEP}]
		>=dev-python/aiosqlite-0.22.1[${PYTHON_USEDEP}]
		>=dev-python/psycopg-3.3.4[${PYTHON_USEDEP}]
		>=dev-python/alembic-1.18.4[${PYTHON_USEDEP}]
		>=dev-python/pycrdt-0.13.1[${PYTHON_USEDEP}]
		>=dev-python/redis-8.0.0[${PYTHON_USEDEP}]
		>=dev-python/pytz-2026.2[${PYTHON_USEDEP}]
		>=dev-python/apscheduler-3.11.2[${PYTHON_USEDEP}]
		>=dev-python/restrictedpython-8.2[${PYTHON_USEDEP}]

		>=dev-python/loguru-0.7.3[${PYTHON_USEDEP}]
		>=dev-python/asgiref-3.11.1[${PYTHON_USEDEP}]

		>=dev-python/tiktoken-0.13.0[${PYTHON_USEDEP}]
		>=dev-python/mcp-1.27.2[${PYTHON_USEDEP}]

		>=dev-python/openai-2.29.0[${PYTHON_USEDEP}]
		>=dev-python/anthropic-0.86.0[${PYTHON_USEDEP}]
		>=dev-python/google-genai-1.66.0[${PYTHON_USEDEP}]

		>=sci-ml/langchain-1.2.10[${PYTHON_USEDEP}]
		>=sci-ml/langchain-community-0.4.2[${PYTHON_USEDEP}]
		>=sci-ml/langchain-classic-1.0.7[${PYTHON_USEDEP}]
		>=sci-ml/langchain-text-splitters-1.1.2[${PYTHON_USEDEP}]

		>=dev-python/fake-useragent-2.2.0[${PYTHON_USEDEP}]
		>=sci-ml/chromadb-1.5.9[${PYTHON_USEDEP}]
		>=dev-python/opensearch-py-3.2.0[${PYTHON_USEDEP}]
		>=dev-python/pymysql-1.2.0[${PYTHON_USEDEP}]
		>=dev-python/boto3-1.42.62[${PYTHON_USEDEP}]

		>=dev-python/pyarrow-20.0.0[${PYTHON_USEDEP}]
		>=dev-python/einops-0.8.2[${PYTHON_USEDEP}]

		>=dev-python/ftfy-6.3.1[${PYTHON_USEDEP}]
		>=dev-python/chardet-7.4.3[${PYTHON_USEDEP}]
		>=dev-python/pypdf-6.7.5[${PYTHON_USEDEP}]
		>=dev-python/fpdf2-2.8.7[${PYTHON_USEDEP}]
		>=dev-python/pymdown-extensions-10.21.3[${PYTHON_USEDEP}]
		>=dev-python/docx2txt-0.9[${PYTHON_USEDEP}]
		>=dev-python/python-pptx-1.0.2[${PYTHON_USEDEP}]
		>=dev-python/msoffcrypto-tool-6.0.0[${PYTHON_USEDEP}]
		>=dev-python/nltk-3.9.4[${PYTHON_USEDEP}]
		>=dev-python/markdown-3.10.2[${PYTHON_USEDEP}]
		>=dev-python/beautifulsoup4-4.14.3[${PYTHON_USEDEP}]
		>=dev-python/pypandoc-1.17[${PYTHON_USEDEP}]
		>=dev-python/pandas-3.0.3[${PYTHON_USEDEP}]
		>=dev-python/openpyxl-3.1.5[${PYTHON_USEDEP}]
		>=dev-python/pyxlsb-1.0.10[${PYTHON_USEDEP}]
		>=dev-python/xlrd-2.0.2[${PYTHON_USEDEP}]
		>=dev-python/validators-0.35.0[${PYTHON_USEDEP}]
		>=dev-python/psutil-7.2.2[${PYTHON_USEDEP}]
		>=sci-ml/sentencepiece-0.2.1[${PYTHON_USEDEP}]
		>=dev-python/soundfile-0.13.1[${PYTHON_USEDEP}]
		>=dev-python/azure-ai-documentintelligence-1.0.2[${PYTHON_USEDEP}]

		>=dev-python/pillow-12.2.0[${PYTHON_USEDEP}]
		>=media-libs/opencv-4.13.0[python,${PYTHON_USEDEP}]
		>=sci-ml/rapidocr-onnxruntime-1.4.4[${PYTHON_USEDEP}]
		>=dev-python/rank-bm25-0.2.2[${PYTHON_USEDEP}]

		>=dev-python/onnxruntime-1.26.0[${PYTHON_USEDEP}]

		>=dev-python/black-26.5.1[${PYTHON_USEDEP}]
		>=dev-python/youtube-transcript-api-1.2.4[${PYTHON_USEDEP}]
		>=dev-python/pytube-15.0.0[${PYTHON_USEDEP}]

		>=dev-python/pydub-0.25.1[${PYTHON_USEDEP}]
		>=dev-python/ddgs-9.14.4[${PYTHON_USEDEP}]

		>=dev-python/google-api-python-client-2.197.0[${PYTHON_USEDEP}]
		>=dev-python/google-auth-httplib2-0.4.0[${PYTHON_USEDEP}]
		>=dev-python/google-auth-oauthlib-1.4.0[${PYTHON_USEDEP}]

		>=dev-python/googleapis-common-protos-1.75.0[${PYTHON_USEDEP}]
		>=dev-python/google-cloud-storage-3.9.0[${PYTHON_USEDEP}]

		>=dev-python/azure-identity-1.25.3[${PYTHON_USEDEP}]
		>=dev-python/azure-storage-blob-12.29.0[${PYTHON_USEDEP}]

		>=dev-python/ldap3-2.9.1[${PYTHON_USEDEP}]
	')
"

EPYTEST_PLUGINS=()
distutils_enable_tests pytest

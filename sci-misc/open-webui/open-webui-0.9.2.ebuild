# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_SINGLE_IMPL=1
DISTUTILS_USE_PEP517=hatchling
PYTHON_COMPAT=( python3_{13..14} )

inherit distutils-r1

DESCRIPTION="User-friendly AI Interface"
HOMEPAGE="
	https://pypi.org/project/open-webui/
	https://github.com/open-webui/open-webui
"
SRC_URI="https://github.com/open-webui/open-webui/archive/refs/tags/v${PV}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="BSD-3"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="

	>=sci-ml/transformers-5.5.4[${PYTHON_SINGLE_USEDEP}]
	>=sci-ml/sentence-transformers-5.4.0[${PYTHON_SINGLE_USEDEP}]
	>=sci-ml/accelerate-1.13.0[${PYTHON_SINGLE_USEDEP}]
	>=sci-ml/faster-whisper-1.2.1[${PYTHON_SINGLE_USEDEP}]
	$(python_gen_cond_dep '
		>=dev-python/fastapi-0.135.1[${PYTHON_USEDEP}]
		>=dev-python/uvicorn-0.41.0[${PYTHON_USEDEP}]
		>=dev-python/pydantic-2.12.5[${PYTHON_USEDEP}]
		>=dev-python/python-multipart-0.0.22[${PYTHON_USEDEP}]
		>=dev-python/itsdangerous-2.2.0[${PYTHON_USEDEP}]
		>=dev-python/python-socketio-5.16.1[${PYTHON_USEDEP}]
		>=dev-python/python-jose-3.5.0[${PYTHON_USEDEP}]
		>=dev-python/cryptography-46.0.5[${PYTHON_USEDEP}]
		>=dev-python/bcrypt-5.0.0[${PYTHON_USEDEP}]
		>=dev-python/argon2-cffi-25.1.0[${PYTHON_USEDEP}]
		>=dev-python/pyjwt-2.11.0[${PYTHON_USEDEP}]
		>=dev-python/authlib-1.6.10[${PYTHON_USEDEP}]
		>=dev-python/requests-2.33.1[${PYTHON_USEDEP}]
		>=dev-python/aiohttp-3.13.5[${PYTHON_USEDEP}]
		>=dev-python/async-timeout-5.0.1[${PYTHON_USEDEP}]
		>=dev-python/aiocache-0.12.3[${PYTHON_USEDEP}]
		>=dev-python/aiofiles-25.1.0[${PYTHON_USEDEP}]
		>=dev-python/starlette-compress-1.7.0[${PYTHON_USEDEP}]
		>=app-arch/brotli-1.2.0[python,${PYTHON_USEDEP}]
		>=dev-python/brotlicffi-1.2.0.1[${PYTHON_USEDEP}]
		>=dev-python/httpx-0.28.1[${PYTHON_USEDEP}]
		>=dev-python/starsessions-2.2.1[${PYTHON_USEDEP}]
		>=dev-python/python-mimeparse-2.0.0[${PYTHON_USEDEP}]
		>=dev-python/sqlalchemy-2.0.48[${PYTHON_USEDEP}]
		>=dev-python/aiosqlite-0.21.0[${PYTHON_USEDEP}]
		>=dev-python/psycopg-3.2.9[${PYTHON_USEDEP}]
		>=dev-python/alembic-1.18.4[${PYTHON_USEDEP}]
		>=dev-python/peewee-3.19.0[${PYTHON_USEDEP}]
		>=dev-python/peewee-migrate-1.14.3[${PYTHON_USEDEP}]
		>=dev-python/pycrdt-0.12.47[${PYTHON_USEDEP}]
		>=dev-python/redis-7.4.0[${PYTHON_USEDEP}]
		>=dev-python/pytz-2026.1[${PYTHON_USEDEP}]
		>=dev-python/apscheduler-3.11.2[${PYTHON_USEDEP}]
		>=dev-python/RestrictedPython-8.1[${PYTHON_USEDEP}]

		>=dev-python/loguru-0.7.3[${PYTHON_USEDEP}]
		>=dev-python/asgiref-3.11.1[${PYTHON_USEDEP}]

		>=dev-python/tiktoken-0.12.0[${PYTHON_USEDEP}]
		>=dev-python/mcp-1.26.0[${PYTHON_USEDEP}]

		>=dev-python/openai-2.29.0[${PYTHON_USEDEP}]
		>=dev-python/anthropic-0.86.0[${PYTHON_USEDEP}]
		>=dev-python/google-genai-1.66.0[${PYTHON_USEDEP}]

		>=sci-ml/langchain-1.2.10[${PYTHON_USEDEP}]
		>=sci-ml/langchain-community-0.4.1[${PYTHON_USEDEP}]
		>=sci-ml/langchain-classic-1.0.1[${PYTHON_USEDEP}]
		>=sci-ml/langchain-text-splitters-1.1.1[${PYTHON_USEDEP}]

		>=dev-python/fake-useragent-2.2.0[${PYTHON_USEDEP}]
		>=sci-ml/chromadb-1.5.2[${PYTHON_USEDEP}]
		>=dev-python/opensearch-py-3.1.0[${PYTHON_USEDEP}]
		>=dev-python/pymysql-1.1.2[${PYTHON_USEDEP}]
		>=dev-python/boto3-1.42.62[${PYTHON_USEDEP}]

		>=dev-python/pyarrow-20.0.0[${PYTHON_USEDEP}]
		>=dev-python/einops-0.8.2[${PYTHON_USEDEP}]

		>=dev-python/ftfy-6.3.1[${PYTHON_USEDEP}]
		>=dev-python/chardet-5.2.0[${PYTHON_USEDEP}]
		>=dev-python/pypdf-6.7.5[${PYTHON_USEDEP}]
		>=dev-python/fpdf2-2.8.7[${PYTHON_USEDEP}]
		>=dev-python/pymdown-extensions-10.21[${PYTHON_USEDEP}]
		>=dev-python/docx2txt-0.9[${PYTHON_USEDEP}]
		>=dev-python/python-pptx-1.0.2[${PYTHON_USEDEP}]
		>=dev-python/msoffcrypto-tool-6.0.0[${PYTHON_USEDEP}]
		>=dev-python/nltk-3.9.3[${PYTHON_USEDEP}]
		>=dev-python/markdown-3.10.2[${PYTHON_USEDEP}]
		>=dev-python/beautifulsoup4-4.14.3[${PYTHON_USEDEP}]
		>=dev-python/pypandoc-1.16.2[${PYTHON_USEDEP}]
		>=dev-python/pandas-3.0.1[${PYTHON_USEDEP}]
		>=dev-python/openpyxl-3.1.5[${PYTHON_USEDEP}]
		>=dev-python/pyxlsb-1.0.10[${PYTHON_USEDEP}]
		>=dev-python/xlrd-2.0.2[${PYTHON_USEDEP}]
		>=dev-python/validators-0.35.0[${PYTHON_USEDEP}]
		>=dev-python/psutil-7.2.2[${PYTHON_USEDEP}]
		>=sci-ml/sentencepiece-0.2.1[${PYTHON_USEDEP}]
		>=dev-python/soundfile-0.13.1[${PYTHON_USEDEP}]
		>=dev-python/azure-ai-documentintelligence-1.0.2[${PYTHON_USEDEP}]

		>=dev-python/pillow-12.1.1[${PYTHON_USEDEP}]
		>=media-libs/opencv-4.13.0[python,${PYTHON_USEDEP}]
		>=sci-ml/rapidocr-onnxruntime-1.4.4[${PYTHON_USEDEP}]
		>=dev-python/rank-bm25-0.2.2[${PYTHON_USEDEP}]

		>=sci-ml/onnxruntime-1.24.3[${PYTHON_USEDEP}]

		>=dev-python/black-26.3.1[${PYTHON_USEDEP}]
		>=dev-python/youtube-transcript-api-1.2.4[${PYTHON_USEDEP}]
		>=dev-python/pytube-15.0.0[${PYTHON_USEDEP}]

		>=dev-python/pydub-0.25.1[${PYTHON_USEDEP}]
		>=dev-python/ddgs-9.11.3[${PYTHON_USEDEP}]

		>=dev-python/google-api-python-client-2.193.0[${PYTHON_USEDEP}]
		>=dev-python/google-auth-httplib2-0.3.0[${PYTHON_USEDEP}]
		>=dev-python/google-auth-oauthlib-1.3.0[${PYTHON_USEDEP}]

		>=dev-python/googleapis-common-protos-1.72.0[${PYTHON_USEDEP}]
		>=dev-python/google-cloud-storage-3.9.0[${PYTHON_USEDEP}]

		>=dev-python/azure-identity-1.25.2[${PYTHON_USEDEP}]
		>=dev-python/azure-storage-blob-12.28.0[${PYTHON_USEDEP}]

		>=dev-python/ldap3-2.9.1[${PYTHON_USEDEP}]
	')
"
#BDEPEND="
#	test? (
#	)
#"

distutils_enable_tests pytest

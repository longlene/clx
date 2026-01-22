# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_SINGLE_IMPL=1
DISTUTILS_USE_PEP517=hatchling
PYTHON_COMPAT=( python3_{13..14} )

inherit distutils-r1

MY_PV="${PV/_beta/-beta.}"

DESCRIPTION="Your Second Brain"
HOMEPAGE="
	https://pypi.org/project/khoj/
	https://khoj.dev
	https://github.com/khoj-ai/khoj
"
SRC_URI="https://github.com/khoj-ai/khoj/archive/refs/tags/${MY_PV}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="AGPL-3.0+"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	>=sci-ml/sentence-transformers-3.4.1[${PYTHON_SINGLE_USEDEP}]
	>=sci-ml/pytorch-2.6.0[${PYTHON_SINGLE_USEDEP}]
	>=sci-ml/transformers-4.51.0[${PYTHON_SINGLE_USEDEP}]
	>=sci-ml/openai-whisper-2023.11.17[${PYTHON_SINGLE_USEDEP}]
	>=sci-ml/huggingface_hub-0.22.2[${PYTHON_SINGLE_USEDEP}]
	$(python_gen_cond_dep '
		>=dev-python/beautifulsoup4-4.12.3[${PYTHON_USEDEP}]
		>=dev-python/dateparser-1.1.1[${PYTHON_USEDEP}]
		>=dev-python/defusedxml-0.7.1[${PYTHON_USEDEP}]
		>=dev-python/fastapi-0.110.0[${PYTHON_USEDEP}]
		>=dev-python/python-multipart-0.0.7[${PYTHON_USEDEP}]
		>=dev-python/jinja2-3.1.6[${PYTHON_USEDEP}]
		>=dev-python/openai-2.0.0[${PYTHON_USEDEP}]
		>=dev-python/tiktoken-0.3.2[${PYTHON_USEDEP}]
		>=dev-python/tenacity-9.0.0[${PYTHON_USEDEP}]
		>=dev-python/magika-0.5.1[${PYTHON_USEDEP}]
		>=dev-python/pillow-10.0.0[${PYTHON_USEDEP}]
		>=dev-python/pydantic-2.0.0[${PYTHON_USEDEP}]
		>=dev-python/pyyaml-6.0[${PYTHON_USEDEP}]
		>=dev-python/rich-13.3.1[${PYTHON_USEDEP}]
		dev-python/click[${PYTHON_USEDEP}]
		>=dev-python/schedule-1.1.0[${PYTHON_USEDEP}]
		>=dev-python/einops-0.8.0[${PYTHON_USEDEP}]
		>=dev-python/uvicorn-0.30.6[${PYTHON_USEDEP}]
		>=dev-python/aiohttp-3.9.0[${PYTHON_USEDEP}]
		>=sci-ml/langchain-text-splitters-0.3.11[${PYTHON_USEDEP}]
		>=sci-ml/langchain-community-0.3.27[${PYTHON_USEDEP}]
		>=dev-python/requests-2.26.0[${PYTHON_USEDEP}]
		>=dev-python/anyio-4.8.0[${PYTHON_USEDEP}]
		>=dev-python/pymupdf-1.24.11[${PYTHON_USEDEP}]
		>=dev-python/django-5.1.15[${PYTHON_USEDEP}]
		>=dev-python/django-unfold-0.42.0[${PYTHON_USEDEP}]
		>=dev-python/authlib-1.6.5[${PYTHON_USEDEP}]
		>=dev-python/itsdangerous-2.1.2[${PYTHON_USEDEP}]
		>=dev-python/httpx-0.28.1[${PYTHON_USEDEP}]
		>=dev-python/pgvector-0.2.4[${PYTHON_USEDEP}]
		>=dev-python/psycopg-2.9.9[${PYTHON_USEDEP}]
		>=dev-python/lxml-4.9.3[${PYTHON_USEDEP}]
		>=dev-python/tzdata-2023.3[${PYTHON_USEDEP}]
		>=sci-ml/rapidocr-1.4.4[${PYTHON_USEDEP}]
		>=dev-python/django-phonenumber-field-7.3.0[${PYTHON_USEDEP}]
		>=dev-python/phonenumbers-8.13.27[${PYTHON_USEDEP}]
		>=dev-python/markdownify-0.11.6[${PYTHON_USEDEP}]
		>=dev-python/markdown-it-py-3.0.0[${PYTHON_USEDEP}]
		>=dev-python/websockets-13.0[${PYTHON_USEDEP}]
		>=dev-python/psutil-5.8.0[${PYTHON_USEDEP}]
		>=dev-python/apscheduler-3.10.0[${PYTHON_USEDEP}]
		>=dev-python/pytz-2024.1[${PYTHON_USEDEP}]
		>=dev-python/cron-descriptor-1.4.3[${PYTHON_USEDEP}]
		>=dev-python/django-apscheduler-0.7.0[${PYTHON_USEDEP}]
		>=dev-python/anthropic-0.75.0[${PYTHON_USEDEP}]
		>=dev-python/docx2txt-0.8[${PYTHON_USEDEP}]
		>=dev-python/google-genai-1.52.0[${PYTHON_USEDEP}]
		>=dev-python/google-auth-2.23.3[${PYTHON_USEDEP}]
		>=dev-python/pyjson5-1.6.7[${PYTHON_USEDEP}]
		>=dev-python/resend-1.0.1[${PYTHON_USEDEP}]
		>=dev-python/email-validator-2.2.0[${PYTHON_USEDEP}]
		>=dev-python/e2b-code-interpreter-1.0.0[${PYTHON_USEDEP}]
		>=dev-python/mcp-1.12.4[${PYTHON_USEDEP}]
	')
"
#BDEPEND="
#	test? (
#	)
#"

EPYTEST_PLUGINS=()
distutils_enable_tests pytest

S="${WORKDIR}"/${PN}-${MY_PV}

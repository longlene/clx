# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_SINGLE_IMPL=1
DISTUTILS_USE_PEP517=hatchling
PYTHON_COMPAT=( python3_{13..15} )

inherit distutils-r1

DESCRIPTION="A production-ready platform for dynamic AI agents"
HOMEPAGE="
	https://pypi.org/project/xagent/
	https://github.com/xorbitsai/xagent
"
SRC_URI="https://github.com/xorbitsai/xagent/archive/refs/tags/v${PV}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="Xagent-Source-License"
SLOT="0"
KEYWORDS="~amd64"
RESTRICT="mirror"

RDEPEND="
	>=dev-python/deepdoc-lib-0.2.2[${PYTHON_SINGLE_USEDEP}]
	$(python_gen_cond_dep '
		>=dev-python/aiohttp-3.12.14[${PYTHON_USEDEP}]
		>=dev-python/aiohttp-socks-0.8.4[${PYTHON_USEDEP}]
		>=dev-python/aiogram-3.4.1[${PYTHON_USEDEP}]
		>=dev-python/alembic-1.13.0[${PYTHON_USEDEP}]
		>=dev-python/anthropic-0.84.0[${PYTHON_USEDEP}]
		>=dev-python/authlib-1.7.2[${PYTHON_USEDEP}]
		>=dev-python/beartype-0.18.5[${PYTHON_USEDEP}]
		>=dev-python/beautifulsoup4-4.12.3[${PYTHON_USEDEP}]
		>=dev-python/bcrypt-4.0.0[${PYTHON_USEDEP}]
		>=dev-python/boxlite-0.6.0[${PYTHON_USEDEP}]
		>=dev-python/celery-5.4.0[${PYTHON_USEDEP}]
		>=dev-python/cloudpickle-3.0.0[${PYTHON_USEDEP}]
		>=dev-python/cryptography-3.0.0[${PYTHON_USEDEP}]
		>=dev-python/docker-7.1.0[${PYTHON_USEDEP}]
		>=dev-python/exa-py-2.0.0[${PYTHON_USEDEP}]
		>=dev-python/fastapi-0.35.0[${PYTHON_USEDEP}]
		>=dev-python/filelock-3.0.0[${PYTHON_USEDEP}]
		>=dev-python/fsspec-2024.0.0[${PYTHON_USEDEP}]
		>=dev-python/google-api-python-client-2.111.0[${PYTHON_USEDEP}]
		>=dev-python/google-auth-oauthlib-1.2.0[${PYTHON_USEDEP}]
		>=dev-python/google-genai-1.65.0[${PYTHON_USEDEP}]
		>=dev-python/html2text-2025.4.15[${PYTHON_USEDEP}]
		>=dev-python/httpx-0.27.2[${PYTHON_USEDEP}]
		>=dev-python/itsdangerous-2.2.0[${PYTHON_USEDEP}]
		>=dev-python/json-repair-0.35.0[${PYTHON_USEDEP}]
		>=dev-python/jsonschema-4.25.1[${PYTHON_USEDEP}]
		>=dev-python/lancedb-0.13.0[${PYTHON_USEDEP}]
		>=sci-ml/langchain-0.3.26[${PYTHON_USEDEP}]
		>=sci-ml/langchain-community-0.3.21[${PYTHON_USEDEP}]
		>=sci-ml/langchain-openai-0.3.27[${PYTHON_USEDEP}]
		>=dev-python/langfuse-4.0.6[${PYTHON_USEDEP}]
		>=dev-python/lark-oapi-1.5.3[${PYTHON_USEDEP}]
		>=dev-python/matplotlib-3.5.0[${PYTHON_USEDEP}]
		>=dev-python/mcp-1.12.4[${PYTHON_USEDEP}]
		>=dev-python/numexpr-2.11.0[${PYTHON_USEDEP}]
		>=dev-python/openai-1.50.0[${PYTHON_USEDEP}]
		>=dev-python/pandas-1.3.0[${PYTHON_USEDEP}]
		>=dev-python/pillow-10.0.0[${PYTHON_USEDEP}]
		>=dev-python/prompt-toolkit-3.0.0[${PYTHON_USEDEP}]
		>=dev-python/pyarrow-16.1.0[${PYTHON_USEDEP}]
		>=dev-python/pydantic-2.11.7[${PYTHON_USEDEP}]
		>=dev-python/pypdf-4.0.0[${PYTHON_USEDEP}]
		>=dev-python/python-dotenv-1.0.1[${PYTHON_USEDEP}]
		>=dev-python/python-jose-3.3.0[${PYTHON_USEDEP}]
		>=dev-python/pyyaml-6.0.2[${PYTHON_USEDEP}]
		>=dev-python/redis-5.0.0[${PYTHON_USEDEP}]
		>=dev-python/requests-2.32.0[${PYTHON_USEDEP}]
		>=dev-python/rich-14.0.0[${PYTHON_USEDEP}]
		>=dev-python/s3fs-2026.2.0[${PYTHON_USEDEP}]
		>=dev-python/sqlalchemy-2.0.0[${PYTHON_USEDEP}]
		>=dev-python/tiktoken-0.8.0[${PYTHON_USEDEP}]
		>=dev-python/tqdm-4.66.0[${PYTHON_USEDEP}]
		>=dev-python/uvicorn-0.35.0[${PYTHON_USEDEP}]
		>=dev-python/websockets-15.0.1[${PYTHON_USEDEP}]
		>=dev-python/xinference-client-2.3.0[${PYTHON_USEDEP}]
		>=dev-python/zai-sdk-0.0.3.2[${PYTHON_USEDEP}]
	')
"

BDEPEND="
	$(python_gen_cond_dep '
		dev-python/hatch-vcs[${PYTHON_USEDEP}]
	')
"

EPYTEST_PLUGINS=()
distutils_enable_tests pytest

export SETUPTOOLS_SCM_PRETEND_VERSION="${PV}"

# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{13..15} )

inherit distutils-r1

DESCRIPTION="Unified Python library for Large Language Model providers"
HOMEPAGE="https://github.com/chrishayuk/chuk-llm"
SRC_URI="https://github.com/chrishayuk/chuk-llm/archive/refs/tags/v${PV}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	sci-ml/transformers
	>=dev-python/aiohttp-3.13.4[${PYTHON_USEDEP}]
	>=dev-python/anthropic-0.62.0[${PYTHON_USEDEP}]
	>=dev-python/chuk-ai-session-manager-0.8.2[${PYTHON_USEDEP}]
	>=dev-python/google-genai-1.70.0[${PYTHON_USEDEP}]
	>=dev-python/groq-0.25.0[${PYTHON_USEDEP}]
	>=dev-python/httpx-0.28.1[${PYTHON_USEDEP}]
	>=dev-python/ibm-watsonx-ai-1.3.30[${PYTHON_USEDEP}]
	>=dev-python/jinja2-3.1.6[${PYTHON_USEDEP}]
	>=dev-python/mistralai-2.2.0[${PYTHON_USEDEP}]
	>=dev-python/ollama-0.5.3[${PYTHON_USEDEP}]
	>=dev-python/openai-1.79.0[${PYTHON_USEDEP}]
	>=dev-python/python-dotenv-1.1.0[${PYTHON_USEDEP}]
	>=dev-python/pyyaml-6.0.2[${PYTHON_USEDEP}]
	>=dev-python/tiktoken-0.11.0[${PYTHON_USEDEP}]
	>=dev-python/ujson-5.12.0[${PYTHON_USEDEP}]
"

distutils_enable_tests pytest

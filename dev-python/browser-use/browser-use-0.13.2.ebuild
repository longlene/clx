# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=hatchling
PYTHON_COMPAT=( python3_{13..15} )

inherit distutils-r1

DESCRIPTION="Make websites accessible for AI agents"
HOMEPAGE="
	https://github.com/browser-use/browser-use
	https://pypi.org/project/browser-use/
"
SRC_URI="https://github.com/browser-use/browser-use/archive/refs/tags/${PV}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	>=dev-python/aiohttp-3.13.4[${PYTHON_USEDEP}]
	>=dev-python/anyio-4.12.1[${PYTHON_USEDEP}]
	>=dev-python/bubus-1.5.6[${PYTHON_USEDEP}]
	>=dev-python/click-8.3.1[${PYTHON_USEDEP}]
	>=dev-python/inquirerpy-0.3.4[${PYTHON_USEDEP}]
	>=dev-python/rich-14.3.1[${PYTHON_USEDEP}]
	>=dev-python/google-api-core-2.29.0[${PYTHON_USEDEP}]
	>=dev-python/httpx-0.28.1[${PYTHON_USEDEP}]
	>=dev-python/posthog-7.7.0[${PYTHON_USEDEP}]
	>=dev-python/psutil-7.2.2[${PYTHON_USEDEP}]
	>=dev-python/pydantic-2.12.5[${PYTHON_USEDEP}]
	>=dev-python/python-dotenv-1.2.2[${PYTHON_USEDEP}]
	>=dev-python/requests-2.33.0[${PYTHON_USEDEP}]
	>=dev-python/screeninfo-0.8.1[${PYTHON_USEDEP}]
	>=dev-python/typing-extensions-4.15.0[${PYTHON_USEDEP}]
	>=dev-python/uuid7-0.1.0[${PYTHON_USEDEP}]
	>=dev-python/google-genai-1.65.0[${PYTHON_USEDEP}]
	>=dev-python/openai-2.16.0[${PYTHON_USEDEP}]
	>=dev-python/anthropic-0.76.0[${PYTHON_USEDEP}]
	>=dev-python/groq-1.0.0[${PYTHON_USEDEP}]
	>=dev-python/ollama-0.6.1[${PYTHON_USEDEP}]
	>=dev-python/google-api-python-client-2.188.0[${PYTHON_USEDEP}]
	>=dev-python/google-auth-2.48.0[${PYTHON_USEDEP}]
	>=dev-python/google-auth-oauthlib-1.2.4[${PYTHON_USEDEP}]
	>=dev-python/mcp-1.26.0[${PYTHON_USEDEP}]
	>=dev-python/pypdf-6.10.2[${PYTHON_USEDEP}]
	>=dev-python/reportlab-4.4.9[${PYTHON_USEDEP}]
	>=dev-python/cdp-use-1.4.5[${PYTHON_USEDEP}]
	>=dev-python/pyotp-2.9.0[${PYTHON_USEDEP}]
	>=dev-python/pillow-12.2.0[${PYTHON_USEDEP}]
	>=dev-python/cloudpickle-3.1.2[${PYTHON_USEDEP}]
	>=dev-python/markdownify-1.2.2[${PYTHON_USEDEP}]
	>=dev-python/python-docx-1.2.0[${PYTHON_USEDEP}]
	>=dev-python/browser-use-sdk-3.4.2[${PYTHON_USEDEP}]
"
BDEPEND="
	test? (
		>=dev-python/pytest-8.3.5[${PYTHON_USEDEP}]
		>=dev-python/pytest-asyncio-1.0.0[${PYTHON_USEDEP}]
	)
"

EPYTEST_PLUGINS=()
distutils_enable_tests pytest

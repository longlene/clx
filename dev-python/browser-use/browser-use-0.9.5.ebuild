# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=hatchling
PYTHON_COMPAT=( python3_{11..14} )

inherit distutils-r1

DESCRIPTION="Make websites accessible for AI agents"
HOMEPAGE="
	https://github.com/browser-use/browser-use
	https://pypi.org/project/browser-use/
"
SRC_URI="https://github.com/browser-use/browser-use/archive/refs/tags/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	>=dev-python/aiohttp-3.12.15[${PYTHON_USEDEP}]
	>=dev-python/anyio-4.9.0[${PYTHON_USEDEP}]
	>=dev-python/bubus-1.5.6[${PYTHON_USEDEP}]
	>=dev-python/click-8.1.8[${PYTHON_USEDEP}]
	>=dev-python/inquirerpy-0.3.4[${PYTHON_USEDEP}]
	>=dev-python/rich-14.0.0[${PYTHON_USEDEP}]
	>=dev-python/google-api-core-2.25.0[${PYTHON_USEDEP}]
	>=dev-python/httpx-0.28.1[${PYTHON_USEDEP}]
	>=dev-python/portalocker-2.7.0[${PYTHON_USEDEP}]
	>=dev-python/posthog-3.7.0[${PYTHON_USEDEP}]
	>=dev-python/psutil-7.0.0[${PYTHON_USEDEP}]
	>=dev-python/pydantic-2.11.5[${PYTHON_USEDEP}]
	>=dev-python/python-dotenv-1.0.1[${PYTHON_USEDEP}]
	>=dev-python/requests-2.32.3[${PYTHON_USEDEP}]
	>=dev-python/screeninfo-0.8.1[${PYTHON_USEDEP}]
	>=dev-python/typing-extensions-4.12.2[${PYTHON_USEDEP}]
	>=dev-python/uuid7-0.1.0[${PYTHON_USEDEP}]
	>=dev-python/authlib-1.6.0[${PYTHON_USEDEP}]
	>=dev-python/google-genai-1.29.0[${PYTHON_USEDEP}]
	>=dev-python/openai-1.99.2[${PYTHON_USEDEP}]
	>=dev-python/anthropic-0.68.1[${PYTHON_USEDEP}]
	>=dev-python/groq-0.30.0[${PYTHON_USEDEP}]
	>=dev-python/ollama-0.5.1[${PYTHON_USEDEP}]
	>=dev-python/google-api-python-client-2.174.0[${PYTHON_USEDEP}]
	>=dev-python/google-auth-2.40.3[${PYTHON_USEDEP}]
	>=dev-python/google-auth-oauthlib-1.2.2[${PYTHON_USEDEP}]
	>=dev-python/mcp-1.10.1[${PYTHON_USEDEP}]
	>=dev-python/pypdf-5.7.0[${PYTHON_USEDEP}]
	>=dev-python/reportlab-4.0.0[${PYTHON_USEDEP}]
	>=dev-python/cdp-use-1.4.0[${PYTHON_USEDEP}]
	>=dev-python/pyotp-2.9.0[${PYTHON_USEDEP}]
	>=dev-python/pillow-11.2.1[${PYTHON_USEDEP}]
	>=dev-python/cloudpickle-3.1.1[${PYTHON_USEDEP}]
	>=dev-python/markdownify-1.2.0[${PYTHON_USEDEP}]
"
BDEPEND="
	test? (
	    >=dev-python/tokencost-0.1.16[${PYTHON_USEDEP}]
		>=dev-python/build-1.2.2[${PYTHON_USEDEP}]
		>=dev-python/pytest-8.3.5[${PYTHON_USEDEP}]
		>=dev-python/pytest-asyncio-1.0.0[${PYTHON_USEDEP}]
	)
"

distutils_enable_tests pytest

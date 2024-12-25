# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=hatchling
PYTHON_COMPAT=( python3_{11..13} )

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
	>=dev-python/MainContentExtractor-0.0.4[${PYTHON_USEDEP}]
	>=dev-python/beautifulsoup4-4.12.3[${PYTHON_USEDEP}]
	>=dev-python/httpx-0.27.2[${PYTHON_USEDEP}]
	>=dev-python/langchain-0.3.9[${PYTHON_USEDEP}]
	>=dev-python/langchain-openai-0.2.10[${PYTHON_USEDEP}]
	>=dev-python/langchain-anthropic-0.3.0[${PYTHON_USEDEP}]
	>=dev-python/langchain-fireworks-0.2.5[${PYTHON_USEDEP}]
	>=dev-python/pydantic-2.10.2[${PYTHON_USEDEP}]
	>=dev-python/python-dotenv-1.0.1[${PYTHON_USEDEP}]
	>=dev-python/requests-2.32.3[${PYTHON_USEDEP}]
	>=dev-python/posthog-3.7.4[${PYTHON_USEDEP}]
	>=dev-python/playwright-1.49.0[${PYTHON_USEDEP}]
"
BDEPEND="
	test? (
	    >=dev-python/tokencost-0.1.16[${PYTHON_USEDEP}]
		>=dev-python/hatch-1.13.0[${PYTHON_USEDEP}]
		>=dev-python/build-1.2.2[${PYTHON_USEDEP}]
		>=dev-python/pytest-8.3.3[${PYTHON_USEDEP}]
		>=dev-python/pytest-asyncio-0.24.0[${PYTHON_USEDEP}]
	)
"

distutils_enable_tests pytest

# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_SINGLE_IMPL=1
DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{11..13} )

inherit distutils-r1

DESCRIPTION="Open-source LLM Friendly Web Crawler & Scraper"
HOMEPAGE="
	https://pypi.org/project/crawl4ai/
	https://github.com/unclecode/crawl4ai
"
SRC_URI="https://github.com/unclecode/crawl4ai/archive/refs/tags/v${PV}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	>=sci-misc/litellm-1.53.1[${PYTHON_SINGLE_USEDEP}]
	$(python_gen_cond_dep '
		>=dev-python/aiosqlite-0.20[${PYTHON_USEDEP}]
		>=dev-python/lxml-5.3[${PYTHON_USEDEP}]
		>=dev-python/numpy-1.26.0[${PYTHON_USEDEP}]
		>=dev-python/pillow-10.4[${PYTHON_USEDEP}]
		|| (
			>=dev-python/playwright-bin-1.49.0[${PYTHON_USEDEP}]
			>=dev-python/playwright-1.49.0[${PYTHON_USEDEP}]
		)
		>=dev-python/python-dotenv-1.0[${PYTHON_USEDEP}]
		>=dev-python/requests-2.26[${PYTHON_USEDEP}]
		>=dev-python/beautifulsoup4-4.12[${PYTHON_USEDEP}]
		>=dev-python/tf-playwright-stealth-1.1.0[${PYTHON_USEDEP}]
		>=dev-python/xxhash-3.4[${PYTHON_USEDEP}]
		>=dev-python/rank-bm25-0.2[${PYTHON_USEDEP}]
		>=dev-python/aiofiles-24.1.0[${PYTHON_USEDEP}]
		>=dev-python/colorama-0.4[${PYTHON_USEDEP}]
		>=dev-python/snowballstemmer-2.2[${PYTHON_USEDEP}]
		>=dev-python/pydantic-2.10[${PYTHON_USEDEP}]
		>=dev-python/pyopenssl-24.3.0[${PYTHON_USEDEP}]
		>=dev-python/psutil-6.1.1[${PYTHON_USEDEP}]
		>=dev-python/nltk-3.9.1[${PYTHON_USEDEP}]
		dev-python/aiofiles[${PYTHON_USEDEP}]
		>=dev-python/rich-13.9.4[${PYTHON_USEDEP}]
		>=dev-python/cssselect-1.2.0[${PYTHON_USEDEP}]
		>=dev-python/httpx-0.27.2[${PYTHON_USEDEP}]
		>=dev-python/fake-useragent-2.0.3[${PYTHON_USEDEP}]
		>=dev-python/click-8.1.7[${PYTHON_USEDEP}]
		>=dev-python/pyperclip-1.8.2[${PYTHON_USEDEP}]
		>=dev-python/chardet-5.2.0[${PYTHON_USEDEP}]
		>=dev-python/aiohttp-3.11.11[${PYTHON_USEDEP}]
		>=app-arch/brotli-1.1.0[${PYTHON_USEDEP}]
		>=dev-python/humanize-4.10.0[${PYTHON_USEDEP}]
	')
"
#BDEPEND="
#	test? (
#	)
#"

distutils_enable_tests pytest

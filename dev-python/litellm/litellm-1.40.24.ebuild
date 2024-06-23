# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=poetry
PYTHON_COMPAT=( python3_{12..13} )

inherit distutils-r1

DESCRIPTION="Library to easily interface with LLM API providers"
HOMEPAGE="
	https://litellm.ai
	https://github.com/BerriAI/litellm
	https://pypi.org/project/litellm/
"
SRC_URI="https://github.com/BerriAI/litellm/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	>=dev-python/openai-1.27.0[${PYTHON_USEDEP}]
	>=dev-python/python-dotenv-0.2.0[${PYTHON_USEDEP}]
	>=dev-python/tiktoken-0.7.0[${PYTHON_USEDEP}]
	>=dev-python/importlib-metadata-6.8.0[${PYTHON_USEDEP}]
	dev-python/tokenizers[${PYTHON_USEDEP}]
	dev-python/click[${PYTHON_USEDEP}]
	>=dev-python/jinja2-3.1.2[${PYTHON_USEDEP}]
	dev-python/aiohttp[${PYTHON_USEDEP}]
	>=dev-python/requests-2.31.0[${PYTHON_USEDEP}]
	>=dev-python/pydantic-2.0.0[${PYTHON_USEDEP}]
	dev-python/ijson[${PYTHON_USEDEP}]
"
BDEPEND="
	test? (
		>=dev-python/flake8-6.1.0[${PYTHON_USEDEP}]
		>=dev-python/black-23.12.0[${PYTHON_USEDEP}]
		>=dev-python/mypy-1.0[${PYTHON_USEDEP}]
		>=dev-python/pytest-mock-3.12.0[${PYTHON_USEDEP}]
	)
"

distutils_enable_tests pytest

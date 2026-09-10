# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{13..15} )

inherit distutils-r1 pypi

DESCRIPTION="Graph-based planning and execution framework for AI agents"
HOMEPAGE="https://github.com/chrishayuk/chuk-ai-planner https://pypi.org/project/chuk-ai-planner/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	dev-python/beautifulsoup4[${PYTHON_USEDEP}]
	>=dev-python/chuk-session-manager-0.1.0[${PYTHON_USEDEP}]
	>=dev-python/chuk-tool-processor-0.11.3[${PYTHON_USEDEP}]
	>=sci-geosciences/geopy-2.4.1[${PYTHON_USEDEP}]
	>=dev-python/lxml-html-clean-0.4.2[${PYTHON_USEDEP}]
	>=dev-python/openai-1.76.2[${PYTHON_USEDEP}]
	>=dev-python/pydantic-2.11.4[${PYTHON_USEDEP}]
	>=dev-python/python-dotenv-1.1.0[${PYTHON_USEDEP}]
	>=dev-python/readability-lxml-0.8.1[${PYTHON_USEDEP}]
	>=dev-python/requests-2.32.3[${PYTHON_USEDEP}]
"

distutils_enable_tests pytest

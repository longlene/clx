# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_SINGLE_IMPL=1
DISTUTILS_USE_PEP517=hatchling
PYTHON_COMPAT=( python3_{11..14} )

inherit distutils-r1

DESCRIPTION="Structured Outputs for LLMs"
HOMEPAGE="
	https://pypi.org/project/instructor/
	https://github.com/567-labs/instructor
"
SRC_URI="https://github.com/instructor-ai/instructor/archive/refs/tags/v${PV}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	>=dev-util/ty-0.0.1
	dev-vcs/pre-commit[${PYTHON_SINGLE_USEDEP}]
	$(python_gen_cond_dep '
		>=dev-python/openai-2.0.0[${PYTHON_USEDEP}]
		>=dev-python/pydantic-2.8.0[${PYTHON_USEDEP}]
		>=dev-python/docstring-parser-0.16[${PYTHON_USEDEP}]
		>=dev-python/typer-0.9.0[${PYTHON_USEDEP}]
		>=dev-python/rich-13.7.0[${PYTHON_USEDEP}]
		>=dev-python/aiohttp-3.9.1[${PYTHON_USEDEP}]
		>=dev-python/tenacity-8.2.3[${PYTHON_USEDEP}]
		dev-python/pydantic[${PYTHON_USEDEP}]
		>=dev-python/jiter-0.6.1[${PYTHON_USEDEP}]
		>=dev-python/jinja2-3.1.4[${PYTHON_USEDEP}]
		>=dev-python/requests-2.32.3[${PYTHON_USEDEP}]
		>=dev-python/diskcache-5.6.3[${PYTHON_USEDEP}]
	')
"
#BDEPEND="
#	test? (
#	)
#"

distutils_enable_tests pytest

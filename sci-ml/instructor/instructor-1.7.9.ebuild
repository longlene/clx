# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=hatchling
PYTHON_COMPAT=( python3_{11..13} )

inherit distutils-r1

DESCRIPTION="structured outputs for llms"
HOMEPAGE="
	https://pypi.org/project/instructor/
	https://github.com/instructor-ai/instructor
"
SRC_URI="https://github.com/instructor-ai/instructor/archive/refs/tags/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	>=dev-python/openai-1.52.0[${PYTHON_USEDEP}]
	>=dev-python/pydantic-2.8.0[${PYTHON_USEDEP}]
	>=dev-python/docstring-parser-0.16[${PYTHON_USEDEP}]
	>=dev-python/typer-0.9.0[${PYTHON_USEDEP}]
	>=dev-python/rich-13.7.0[${PYTHON_USEDEP}]
	>=dev-python/aiohttp-3.9.1[${PYTHON_USEDEP}]
	>=dev-python/tenacity-9.0.0[${PYTHON_USEDEP}]
	>=dev-python/pydantic-core-2.18.0[${PYTHON_USEDEP}]
	>=dev-python/jiter-0.6.1[${PYTHON_USEDEP}]
	>=dev-python/jinja2-3.1.4[${PYTHON_USEDEP}]
	>=dev-python/requests-2.32.3[${PYTHON_USEDEP}]
"
#BDEPEND="
#	test? (
#	)
#"

distutils_enable_tests pytest

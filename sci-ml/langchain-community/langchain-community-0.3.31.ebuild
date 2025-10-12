# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=pdm-backend
PYTHON_COMPAT=( python3_{11..13} )

inherit distutils-r1

DESCRIPTION="Community contributed LangChain integrations"
HOMEPAGE="
	https://pypi.org/project/langchain-community/
	https://github.com/langchain-ai/langchain-community/
"
SRC_URI="https://github.com/langchain-ai/langchain-community/archive/refs/tags/libs/community/v${PV}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	>=sci-ml/langchain-core-0.3.78[${PYTHON_USEDEP}]
	>=sci-ml/langchain-0.3.27[${PYTHON_USEDEP}]
	>=dev-python/sqlalchemy-1.4.0[${PYTHON_USEDEP}]
	>=dev-python/requests-2.32.5[${PYTHON_USEDEP}]
	>=dev-python/pyyaml-5.3.0[${PYTHON_USEDEP}]
	>=dev-python/aiohttp-3.8.3[${PYTHON_USEDEP}]
	>=dev-python/tenacity-8.4.0[${PYTHON_USEDEP}]
	>=dev-python/dataclasses-json-0.6.7[${PYTHON_USEDEP}]
	>=dev-python/pydantic-settings-2.10.1[${PYTHON_USEDEP}]
	>=dev-python/langsmith-0.1.125[${PYTHON_USEDEP}]
	>=dev-python/httpx-sse-0.4.0[${PYTHON_USEDEP}]
	>=dev-python/numpy-2.1.0[${PYTHON_USEDEP}]
"
#BDEPEND="
#	test? (
#	)
#"

distutils_enable_tests pytest

S="${WORKDIR}"/langchain-community-libs-community-v${PV}/libs/community


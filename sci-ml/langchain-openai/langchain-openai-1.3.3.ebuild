# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=hatchling
PYTHON_COMPAT=( python3_{13..15} )

inherit distutils-r1

DESCRIPTION="An integration package connecting OpenAI and LangChain"
HOMEPAGE="
	https://pypi.org/project/langchain-openai/
	https://github.com/langchain-ai/langchain/
"
SRC_URI="https://github.com/langchain-ai/langchain/archive/refs/tags/${PN}==${PV}.tar.gz -> ${P}.gh.tar.gz"
S="${WORKDIR}"/langchain-${P}/libs/partners/openai

LICENSE="MIT"
SLOT="0"
EPYTEST_PLUGINS=( pytest-asyncio )
KEYWORDS="~amd64"

RDEPEND="
	>=sci-ml/langchain-core-1.4.7[${PYTHON_USEDEP}]
	>=dev-python/openai-2.26.0[${PYTHON_USEDEP}]
	>=dev-python/tiktoken-0.7.0[${PYTHON_USEDEP}]
"
BDEPEND="
	test? (
		dev-python/pytest
		dev-python/pytest-asyncio
		dev-python/pytest-cov
		dev-python/pytest-mock
		dev-python/syrupy
	)
"

distutils_enable_tests pytest

# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=pdm-backend
PYTHON_COMPAT=( python3_{11..13} )

inherit distutils-r1

DESCRIPTION="An integration package connecting OpenAI and LangChain"
HOMEPAGE="
	https://pypi.org/project/langchain-core/
	https://github.com/langchain-ai/langchain/
"
SRC_URI="https://github.com/langchain-ai/langchain/archive/refs/tags/${PN}==${PV}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	>=sci-ml/langchain-core-0.3.49[${PYTHON_USEDEP}]
	>=dev-python/openai-1.68.2[${PYTHON_USEDEP}]
	>=dev-python/tiktoken-0.7[${PYTHON_USEDEP}]
"
#BDEPEND="
#	test? (
#	)
#"

distutils_enable_tests pytest

S="${WORKDIR}"/langchain-${P}/libs/partners/openai

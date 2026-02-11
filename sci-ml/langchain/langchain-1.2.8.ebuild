# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=hatchling
PYTHON_COMPAT=( python3_{13..14} )

inherit distutils-r1

DESCRIPTION="Building applications with LLMs through composability"
HOMEPAGE="
	https://pypi.org/project/langchain/
	https://github.com/langchain-ai/langchain/
"
SRC_URI="https://github.com/langchain-ai/langchain/archive/refs/tags/${PN}==${PV}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	>=sci-ml/langchain-core-${PV}[${PYTHON_USEDEP}]
	>=sci-ml/langgraph-1.0.7[${PYTHON_USEDEP}]
	>=dev-python/pydantic-2.7.4[${PYTHON_USEDEP}]
"
#BDEPEND="
#	test? (
#	)
#"

distutils_enable_tests pytest

S="${WORKDIR}"/langchain-${P}/libs/langchain_v1

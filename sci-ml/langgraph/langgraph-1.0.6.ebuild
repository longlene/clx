# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=hatchling
PYTHON_COMPAT=( python3_{13..14} )

inherit distutils-r1

DESCRIPTION="Building stateful, multi-actor applications with LLMs"
HOMEPAGE="
	https://pypi.org/project/langgraph/
	https://github.com/langchain-ai/langgraph/
"
SRC_URI="https://github.com/langchain-ai/langgraph/archive/refs/tags/${PV}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	>=sci-ml/langchain-core-0.1[${PYTHON_USEDEP}]
	>=sci-ml/langgraph-checkpoint-2.1.0[${PYTHON_USEDEP}]
	>=sci-ml/langgraph-sdk-0.3.0[${PYTHON_USEDEP}]
	>=sci-ml/langgraph-prebuilt-1.0.2[${PYTHON_USEDEP}]
	>=dev-python/xxhash-3.5.0[${PYTHON_USEDEP}]
	>=dev-python/pydantic-2.7.4[${PYTHON_USEDEP}]
"
#BDEPEND="
#	test? (
#	)
#"

EPYTEST_PLUGINS=()
distutils_enable_tests pytest

S="${WORKDIR}"/${P}/libs/${PN}

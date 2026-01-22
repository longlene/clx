# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=hatchling
PYTHON_COMPAT=( python3_{13..14} )

inherit distutils-r1

DESCRIPTION="Library with base interfaces for LangGraph checkpoint savers"
HOMEPAGE="
	https://pypi.org/project/langgraph-checkpoint/
	https://github.com/langchain-ai/langgraph/
"
SRC_URI="https://github.com/langchain-ai/langgraph/archive/refs/tags/checkpoint==${PV}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	>=sci-ml/langchain-core-0.2.38[${PYTHON_USEDEP}]
	>=dev-python/ormsgpack-1.12.0[${PYTHON_USEDEP}]
"
#BDEPEND="
#	test? (
#	)
#"

EPYTEST_PLUGINS=()
distutils_enable_tests pytest

S="${WORKDIR}"/${P}/libs/checkpoint

# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=hatchling
PYTHON_COMPAT=( python3_{13..14} )

inherit distutils-r1

MY_PN="${PN/langgraph-/}"

DESCRIPTION="SDK for interacting with LangGraph API"
HOMEPAGE="
	https://pypi.org/project/langgraph-sdk/
	https://github.com/langchain-ai/langgraph/
"
SRC_URI="https://github.com/langchain-ai/langgraph/archive/refs/tags/${MY_PN}==${PV}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	>=dev-python/httpx-0.25.2[${PYTHON_USEDEP}]
	>=dev-python/orjson-3.10.1[${PYTHON_USEDEP}]
"
#BDEPEND="
#	test? (
#	)
#"

EPYTEST_PLUGINS=()
distutils_enable_tests pytest

S="${WORKDIR}"/${P}/libs/${MY_PN}-py

# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=pdm-backend
PYTHON_COMPAT=( python3_{11..14} )

inherit distutils-r1

DESCRIPTION="Building applications with LLMs through composability"
HOMEPAGE="
	https://pypi.org/project/langchain-core/
	https://github.com/langchain-ai/langchain/
"
SRC_URI="https://github.com/langchain-ai/langchain/archive/refs/tags/${PN}==${PV}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	>=dev-python/langsmith-0.3.45[${PYTHON_USEDEP}]
	>=dev-python/tenacity-8.4.0[${PYTHON_USEDEP}]
	>=dev-python/jsonpatch-1.33[${PYTHON_USEDEP}]
	>=dev-python/pyyaml-5.3.0[${PYTHON_USEDEP}]
	>=dev-python/typing-extensions-4.7.0[${PYTHON_USEDEP}]
	>=dev-python/packaging-23.2.0[${PYTHON_USEDEP}]
	>=dev-python/pydantic-2.7.4[${PYTHON_USEDEP}]
	>=dev-python/uuid-utils-0.12.0[${PYTHON_USEDEP}]
"
#BDEPEND="
#	test? (
#	)
#"

distutils_enable_tests pytest

S="${WORKDIR}"/langchain-${P}/libs/core


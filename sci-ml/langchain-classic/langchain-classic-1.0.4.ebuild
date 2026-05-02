# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=hatchling
PYTHON_COMPAT=( python3_{11..14} )

inherit distutils-r1

DESCRIPTION="Building applications with LLMs through composability"
HOMEPAGE="
	https://pypi.org/project/langchain-classic/
	https://github.com/langchain-ai/langchain/
"
SRC_URI="https://github.com/langchain-ai/langchain/archive/refs/tags/${PN}==${PV}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	>=sci-ml/langchain-core-1.3.2[${PYTHON_USEDEP}]
	>=sci-ml/langchain-text-splitters-1.1.2[${PYTHON_USEDEP}]
	>=dev-python/langsmith-0.1.17[${PYTHON_USEDEP}]
	>=dev-python/pydantic-2.7.4[${PYTHON_USEDEP}]
	>=dev-python/sqlalchemy-1.4.0[${PYTHON_USEDEP}]
	>=dev-python/requests-2.0.0[${PYTHON_USEDEP}]
	>=dev-python/pyyaml-5.3.0[${PYTHON_USEDEP}]
"
#BDEPEND="
#	test? (
#	)
#"

distutils_enable_tests pytest

S="${WORKDIR}"/langchain-${P}/libs/langchain/

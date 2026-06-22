# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=hatchling
PYTHON_COMPAT=( python3_{13..15} )

inherit distutils-r1

DESCRIPTION="An integration package connecting Google's genai package and LangChain"
HOMEPAGE="
	https://github.com/langchain-ai/langchain-google/
"
SRC_URI="https://github.com/langchain-ai/langchain-google/archive/refs/tags/libs/genai/v${PV}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="MIT"
SLOT="0"
S="${WORKDIR}"/langchain-google-libs-genai-v${PV}/libs/genai/
KEYWORDS="~amd64"

RDEPEND="
	>=sci-ml/langchain-core-1.2.11[${PYTHON_USEDEP}]
	>=dev-python/google-genai-1.65.0[${PYTHON_USEDEP}]
	>=dev-python/pydantic-2.0.0[${PYTHON_USEDEP}]
	>=dev-python/filetype-1.2.0[${PYTHON_USEDEP}]
"
#BDEPEND="
#	test? (
#	)
#"

distutils_enable_tests pytest

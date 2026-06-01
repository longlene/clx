# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=pdm-backend
PYTHON_COMPAT=( python3_{11..14} )

inherit distutils-r1

DESCRIPTION="Buildding application with LLMs through composability"
HOMEPAGE="
	https://pypi.org/project/langchain-experimental/
	https://github.com/langchain-ai/langchain-experimental/
"
SRC_URI="https://github.com/langchain-ai/langchain-experimental/archive/refs/tags/libs/experimental/v${PV}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="MIT"
SLOT="0"
S="${WORKDIR}"/langchain-experimental-libs-experimental-v${PV}/libs/experimental
KEYWORDS="~amd64"

RDEPEND="
	>=sci-ml/langchain-core-1.0.0[${PYTHON_USEDEP}]
	>=sci-ml/langchain-community-0.4.0[${PYTHON_USEDEP}]
"
#BDEPEND="
#	test? (
#	)
#"

distutils_enable_tests pytest

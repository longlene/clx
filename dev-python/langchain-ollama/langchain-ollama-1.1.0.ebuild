# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=hatchling
PYTHON_COMPAT=( python3_{13..15} )

inherit distutils-r1

DESCRIPTION="An integration package connecting Ollama and LangChain"
HOMEPAGE="https://github.com/langchain-ai/langchain/"
SRC_URI="https://github.com/langchain-ai/langchain/archive/refs/tags/${PN}==${PV}.tar.gz -> ${P}.gh.tar.gz"

S="${WORKDIR}/langchain-${P}/libs/partners/${PN#*-}"
LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	>=sci-ml/langchain-core-1.2.21[${PYTHON_USEDEP}]
"

distutils_enable_tests pytest

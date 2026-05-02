# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=poetry
PYTHON_COMPAT=( python3_{11..14} )

inherit distutils-r1

DESCRIPTION="An integration package connecting Milvus and LangChain"
HOMEPAGE="
	https://pypi.org/project/langchain-milvus/
	https://github.com/langchain-ai/langchain-milvus/
"
SRC_URI="https://github.com/langchain-ai/langchain-milvus/archive/refs/tags/libs/milvus/v${PV}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	>=dev-python/pymilvus-2.6.0[${PYTHON_USEDEP}]
	>=sci-ml/langchain-core-1.0.0[${PYTHON_USEDEP}]
"
#BDEPEND="
#	test? (
#	)
#"

distutils_enable_tests pytest

S="${WORKDIR}"/langchain-milvus-libs-milvus-v${PV}/libs/milvus

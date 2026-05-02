# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=poetry
PYTHON_COMPAT=( python3_{11..14} )

inherit distutils-r1

DESCRIPTION="An integration package connecting Elasticsearch and LangChain"
HOMEPAGE="
	https://pypi.org/project/langchain-elasticsearch/
	https://github.com/langchain-ai/langchain-elastic/
"
SRC_URI="https://github.com/langchain-ai/langchain-elastic/archive/refs/tags/libs/elasticsearch/v${PV}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	>=sci-ml/langchain-core-1.2.5[${PYTHON_USEDEP}]
	>=dev-python/elasticsearch-8.19.0[${PYTHON_USEDEP}]
"
#BDEPEND="
#	test? (
#	)
#"

distutils_enable_tests pytest

S="${WORKDIR}"/langchain-elastic-libs-elasticsearch-v${PV}/libs/elasticsearch

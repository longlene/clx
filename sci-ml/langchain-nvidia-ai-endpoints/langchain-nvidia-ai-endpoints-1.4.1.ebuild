# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=poetry
PYTHON_COMPAT=( python3_{13..15} )

inherit distutils-r1

DESCRIPTION="An integration package connecting NVIDIA AI Endpoints and LangChain"
HOMEPAGE="
	https://pypi.org/project/langchain-nvidia-ai-endpoints/
	https://github.com/langchain-ai/langchain-nvidia/
"
SRC_URI="https://github.com/langchain-ai/langchain-nvidia/archive/refs/tags/libs/ai-endpoints/v${PV}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="MIT"
SLOT="0"
S="${WORKDIR}"/langchain-nvidia-libs-ai-endpoints-v${PV}/libs/ai-endpoints/
KEYWORDS="~amd64"

RDEPEND="
	>=sci-ml/langchain-core-1.2.5[${PYTHON_USEDEP}]
	>=dev-python/aiohttp-3.13.3[${PYTHON_USEDEP}]
	>=dev-python/filetype-1.2.0[${PYTHON_USEDEP}]
	>=dev-python/requests-2.28.0[${PYTHON_USEDEP}]
"
#BDEPEND="
#	test? (
#	)
#"

distutils_enable_tests pytest

# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_SINGLE_IMPL=1
DISTUTILS_USE_PEP517=hatchling
PYTHON_COMPAT=( python3_{11..14} )

inherit distutils-r1

MY_P="crewai-${PV}"

DESCRIPTION="Set of tools for the crewAI framework"
HOMEPAGE="
	https://pypi.org/project/crewai-tools
	https://crewai.com
	https://github.com/crewAIInc/crewAI
"
SRC_URI="https://github.com/crewAIInc/crewAI/archive/refs/tags/${PV}.tar.gz -> ${MY_P}.gh.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	$(python_gen_cond_dep '
    	>=dev-python/lancedb-0.5.4[${PYTHON_USEDEP}]
    	>=dev-python/pytube-15.0.0[${PYTHON_USEDEP}]
    	>=dev-python/requests-2.32.5[${PYTHON_USEDEP}]
    	>=dev-python/docker-7.1.0[${PYTHON_USEDEP}]
    	>=sci-ml/crewai-1.6.1[${PYTHON_USEDEP}]
    	>=dev-python/lancedb-0.5.4[${PYTHON_USEDEP}]
    	>=dev-python/tiktoken-0.8.0[${PYTHON_USEDEP}]
    	>=dev-python/beautifulsoup4-4.13.4[${PYTHON_USEDEP}]
    	>=dev-python/python-docx-1.2.0[${PYTHON_USEDEP}]
    	>=dev-python/youtube-transcript-api-1.2.2[${PYTHON_USEDEP}]
    	>=dev-python/pymupdf-1.26.6[${PYTHON_USEDEP}]
	')
"
#BDEPEND="
#	test? (
#	)
#"

distutils_enable_tests pytest

S="${WORKDIR}"/crewAI-${PV}/lib/${PN}

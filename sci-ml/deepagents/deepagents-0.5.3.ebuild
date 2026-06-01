# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{13..14} )

inherit distutils-r1

DESCRIPTION="General purpose 'deep agent' with sub-agent spawning, todo list"
HOMEPAGE="
	https://pypi.org/project/deepagents/
	https://github.com/langchain-ai/deepagents
"
SRC_URI="https://github.com/langchain-ai/deepagents/archive/refs/tags/deepagents==${PV}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="MIT"
SLOT="0"
S="${WORKDIR}"/deepagents-${P}/libs/${PN}
KEYWORDS="~amd64"

RDEPEND="
	>=sci-ml/langchain-core-1.2.27[${PYTHON_USEDEP}]
	>=dev-python/langsmith-0.3.0[${PYTHON_USEDEP}]
	>=sci-ml/langchain-1.2.15[${PYTHON_USEDEP}]
	>=sci-ml/langchain-anthropic-1.4.0[${PYTHON_USEDEP}]
	>=sci-ml/langchain-google-genai-4.2.1[${PYTHON_USEDEP}]
	dev-python/wcmatch[${PYTHON_USEDEP}]
"
#BDEPEND="
#	test? (
#	)
#"

EPYTEST_PLUGINS=()
distutils_enable_tests pytest

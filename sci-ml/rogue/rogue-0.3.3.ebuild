# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_SINGLE_IMPL=1
DISTUTILS_USE_PEP517=hatchling
PYTHON_COMPAT=( python3_{13..14} )

inherit distutils-r1

DESCRIPTION="AI Agent Evaluator & Red Team Platform"
HOMEPAGE="
	https://pypi.org/project/rogue/
	https://github.com/qualifire-dev/rogue
"
SRC_URI="https://github.com/qualifire-dev/rogue/archive/refs/tags/v${PV}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	>=sci-ml/datasets-3.6.0[${PYTHON_SINGLE_USEDEP}]
	$(python_gen_cond_dep '
		>=dev-python/a2a-sdk-0.2.10[${PYTHON_USEDEP}]
		>=dev-python/backoff-2.2.1[${PYTHON_USEDEP}]
		>=dev-python/boto3-1.40.69[${PYTHON_USEDEP}]
		>=dev-python/click-8.0.0[${PYTHON_USEDEP}]
		>=dev-python/fastapi-0.121.0[${PYTHON_USEDEP}]
		>=dev-python/fastmcp-2.12.5[${PYTHON_USEDEP}]
		>=dev-python/google-adk-1.5.0[${PYTHON_USEDEP}]
		>=sci-ml/langchain-openai-0.3.35[${PYTHON_USEDEP}]
		>=sci-misc/litellm-1.76.1[${PYTHON_USEDEP}]
		>=dev-python/loguru-0.7.3[${PYTHON_USEDEP}]
		>=dev-python/platformdirs-4.3.8[${PYTHON_USEDEP}]
		>=dev-python/psutil-7.0.0[${PYTHON_USEDEP}]
		>=dev-python/pydantic-2.11.7[${PYTHON_USEDEP}]
		>=dev-python/pydantic-yaml-1.5.1[${PYTHON_USEDEP}]
		>=dev-python/python-dotenv-1.1.1[${PYTHON_USEDEP}]
		>=dev-python/requests-2.32.4[${PYTHON_USEDEP}]
		>=dev-python/rich-14.0.0[${PYTHON_USEDEP}]
		>=dev-python/rogue-ai-sdk-0.1.3[${PYTHON_USEDEP}]
		>=dev-python/uvicorn-0.38.0[${PYTHON_USEDEP}]
	')
"
#BDEPEND="
#	test? (
#	)
#"

EPYTEST_PLUGINS=()
distutils_enable_tests pytest

PATCHES=(
	"${FILESDIR}"/install-fix.patch
)

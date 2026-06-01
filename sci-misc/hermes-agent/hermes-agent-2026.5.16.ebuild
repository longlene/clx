# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{13..14} )

inherit distutils-r1

DESCRIPTION="The agent that grows with you"
HOMEPAGE="
	https://pypi.org/project/hermes-agent/
	https://github.com/nousresearch/hermes-agent
	https://hermes-agent.nousresearch.com/
"
SRC_URI="
	https://github.com/NousResearch/hermes-agent/archive/refs/tags/v${PV}.tar.gz -> ${P}.gh.tar.gz
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	>=dev-python/openai-2.21.0[${PYTHON_USEDEP}]
	>=dev-python/anthropic-0.39.0[${PYTHON_USEDEP}]
	>=dev-python/python-dotenv-1.2.1[${PYTHON_USEDEP}]
	>=dev-python/fire-0.7.1[${PYTHON_USEDEP}]
	>=dev-python/httpx-0.28.1[${PYTHON_USEDEP}]
	>=dev-python/rich-14.3.3[${PYTHON_USEDEP}]
	>=dev-python/tenacity-9.1.4[${PYTHON_USEDEP}]
	>=dev-python/pyyaml-6.0.2[${PYTHON_USEDEP}]
	>=dev-python/requests-2.33.0[${PYTHON_USEDEP}]
	>=dev-python/jinja22-3.1.5[${PYTHON_USEDEP}]
	>=dev-python/pydantic-2.12.5[${PYTHON_USEDEP}]
	>=dev-python/prompt-toolkit-3.0.52[${PYTHON_USEDEP}]
	>=dev-python/exa-py-2.9.0[${PYTHON_USEDEP}]
	>=dev-python/firecrawl-py-4.16.0[${PYTHON_USEDEP}]
	>=dev-python/parallel-web-0.4.2[${PYTHON_USEDEP}]
	>=dev-python/fal-client-0.13.1[${PYTHON_USEDEP}]
	>=dev-python/edge-tts-7.2.7[${PYTHON_USEDEP}]
	>=dev-python/pyjwt-2.12.0[${PYTHON_USEDEP}]
"
#BDEPEND="
#	test? (
#	)
#"

EPYTEST_PLUGINS=()
distutils_enable_tests pytest

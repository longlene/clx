# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{13..15} )

inherit distutils-r1

DESCRIPTION="Agent framework and applications built upon Qwen>=3.0"
HOMEPAGE="
	https://pypi.org/project/qwen-agent
	https://github.com/QwenLM/Qwen-Agent
"
SRC_URI="
	https://github.com/QwenLM/Qwen-Agent/archive/refs/tags/v${PV}.tar.gz -> ${P}.gh.tar.gz
"

LICENSE="Apache-2.0"
SLOT="0"
S="${WORKDIR}"/Qwen-Agent-${PV}
KEYWORDS="~amd64"

RDEPEND="
	>=dev-python/dashscope-1.11.0[${PYTHON_USEDEP}]
	dev-python/eval-type-backport[${PYTHON_USEDEP}]
	dev-python/json5[${PYTHON_USEDEP}]
	dev-python/jsonlines[${PYTHON_USEDEP}]
	dev-python/jsonschema[${PYTHON_USEDEP}]
	dev-python/openai[${PYTHON_USEDEP}]
	>=dev-python/pydantic-2.3.0[${PYTHON_USEDEP}]
	dev-python/requests[${PYTHON_USEDEP}]
	dev-python/tiktoken[${PYTHON_USEDEP}]
	dev-python/pillow[${PYTHON_USEDEP}]
	dev-python/python-dotenv[${PYTHON_USEDEP}]
"
#BDEPEND="
#	test? (
#	)
#"

EPYTEST_PLUGINS=()
distutils_enable_tests pytest

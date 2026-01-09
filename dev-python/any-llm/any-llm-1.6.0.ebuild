# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{13..14} )

inherit distutils-r1

DESCRIPTION="Communicate with an LLM provider using a single interface"
HOMEPAGE="
	https://pypi.org/project/any-llm/
	https://github.com/mozilla-ai/any-llm
"
SRC_URI="https://github.com/mozilla-ai/any-llm/archive/refs/tags/${PV}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	>=dev-python/pydantic-2.0.0[${PYTHON_USEDEP}]
	>=dev-python/openai-1.99.3[${PYTHON_USEDEP}]
	dev-python/rich[${PYTHON_USEDEP}]
	dev-python/httpx[${PYTHON_USEDEP}]
"
#BDEPEND="
#	test? (
#	)
#"

EPYTEST_PLUGINS=()
distutils_enable_tests pytest

export SETUPTOOLS_SCM_PRETEND_VERSION_FOR_ANY_LLM_SDK="${PV}"

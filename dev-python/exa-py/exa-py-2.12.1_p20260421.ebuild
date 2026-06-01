# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=poetry
PYTHON_COMPAT=( python3_{13..14} )

inherit distutils-r1

EGIT_COMMIT="0ddceedf17e13f3113d19839179ca25b12adeb9a"

DESCRIPTION="Python SDK for Exa API"
HOMEPAGE="
	https://pypi.org/project/exa-py/
	https://github.com/exa-labs/exa-py
"
SRC_URI="https://github.com/exa-labs/exa-py/archive/${EGIT_COMMIT}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="MIT"
SLOT="0"
S="${WORKDIR}"/${PN}-${EGIT_COMMIT}
KEYWORDS="~amd64"

RDEPEND="
	>=dev-python/requests-2.32.3[${PYTHON_USEDEP}]
	>=dev-python/typing-extensions-4.12.2[${PYTHON_USEDEP}]
	>=dev-python/openai-1.48[${PYTHON_USEDEP}]
	>=dev-python/pydantic-2.10.6[${PYTHON_USEDEP}]
	>=dev-python/httpx-0.28.1[${PYTHON_USEDEP}]
	>=dev-python/httpcore-1.0.9[${PYTHON_USEDEP}]
	>=dev-python/python-dotenv-1.0.1[${PYTHON_USEDEP}]
"
#BDEPEND="
#	test? (
#	)
#"

EPYTEST_PLUGINS=()
distutils_enable_tests pytest

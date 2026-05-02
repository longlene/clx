# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=hatchling
PYTHON_COMPAT=( python3_{13..14} )

inherit distutils-r1

EGIT_COMMIT="35d4991b34282060cf4b9c101a67dd214174b23d"

DESCRIPTION="Minimal autonomous agent harness with LangGraph Deep Agents"
HOMEPAGE="
	https://github.com/tkellogg/open-strix
"
SRC_URI="https://github.com/tkellogg/open-strix/archive/${EGIT_COMMIT}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	>=dev-python/aiohttp-3.12.15[${PYTHON_USEDEP}]
	>=dev-python/apscheduler-3.11.2[${PYTHON_USEDEP}]
	>=sci-ml/deepagents-0.4.1[${PYTHON_USEDEP}]
	>=dev-python/discord-py-2.6.4[${PYTHON_USEDEP}]
	>=dev-python/matplotlib-3.8[${PYTHON_USEDEP}]
	>=dev-python/mcp-1.26.0[${PYTHON_USEDEP}]
	>=dev-python/python-dotenv-1.2.1[${PYTHON_USEDEP}]
	>=dev-python/pyyaml-6.0.3[${PYTHON_USEDEP}]
"
BDEPEND="
	dev-python/websockets[${PYTHON_USEDEP}]
"
#BDEPEND="
#	test? (
#	)
#"

EPYTEST_PLUGINS=()
distutils_enable_tests pytest

S="${WORKDIR}"/${PN}-${EGIT_COMMIT}

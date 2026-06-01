# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=hatchling
PYTHON_COMPAT=( python3_12 python3_13 python3_14  )

inherit distutils-r1

MY_PN="${PN}-python"
MY_P="${MY_PN}-${PV}"

DESCRIPTION="Claude Agent SDK for Python"
HOMEPAGE="
	https://pypi.org/project/claude-agent-sdk/
	https://github.com/anthropics/claude-agent-sdk-python
"
SRC_URI="https://github.com/anthropics/claude-agent-sdk-python/archive/refs/tags/v${PV}.tar.gz -> ${MY_P}.gh.tar.gz"

LICENSE="MIT"
SLOT="0"
S="${WORKDIR}"/${MY_P}
KEYWORDS="~amd64"

RDEPEND="
	>=dev-python/anyio-4.0.0[${PYTHON_USEDEP}]
	>=dev-python/mcp-0.1.0[${PYTHON_USEDEP}]
"
#BDEPEND="
#	test? (
#	)
#"

EPYTEST_PLUGINS=()
distutils_enable_tests pytest

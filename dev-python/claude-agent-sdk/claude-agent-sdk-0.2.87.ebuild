# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=hatchling
PYTHON_COMPAT=( python3_{13..15} )

inherit distutils-r1

MY_PN="${PN}-python"
MY_P="${MY_PN}-${PV}"

DESCRIPTION="Python SDK for Claude Code"
HOMEPAGE="
	https://pypi.org/project/claude-agent-sdk/
	https://github.com/anthropics/claude-agent-sdk-python
"
SRC_URI="https://github.com/anthropics/claude-agent-sdk-python/archive/refs/tags/v${PV}.tar.gz -> ${MY_P}.gh.tar.gz"

S="${WORKDIR}"/${MY_P}

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	>=dev-python/anyio-4.0.0[${PYTHON_USEDEP}]
	>=dev-python/mcp-1.23.0[${PYTHON_USEDEP}]
	dev-python/sniffio[${PYTHON_USEDEP}]
"
#BDEPEND="
#	test? (
#	)
#"

EPYTEST_PLUGINS=()
distutils_enable_tests pytest

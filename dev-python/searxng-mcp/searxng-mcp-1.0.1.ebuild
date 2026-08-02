# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{13..15} )

inherit distutils-r1 pypi

DESCRIPTION="SearXNG Search Engine MCP Server for Agentic AI!"
HOMEPAGE="https://pypi.org/project/searxng-mcp/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

IUSE="+agent +mcp +logfire"

RDEPEND="
	dev-python/agent-utilities[${PYTHON_USEDEP}]
	agent? ( dev-python/agent-utilities[agent,logfire,${PYTHON_USEDEP}] )
	mcp? ( dev-python/agent-utilities[mcp,${PYTHON_USEDEP}] )
	logfire? ( dev-python/agent-utilities[logfire,${PYTHON_USEDEP}] )
"

src_prepare() {
	rm -r scripts tests || die
	distutils-r1_src_prepare
}

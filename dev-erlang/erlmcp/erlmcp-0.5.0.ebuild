# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit rebar3

DESCRIPTION="Model Context Protocol (MCP) SDK for Erlang"
HOMEPAGE="https://github.com/erlsci/erlmcp"
SRC_URI="https://github.com/erlsci/erlmcp/archive/refs/tags/${PV}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}
	>=dev-erlang/jsx-3.1.0
	>=dev-erlang/jesse-1.8.1
"
BDEPEND=""

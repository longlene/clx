# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit rebar3

DESCRIPTION="MCP (Model Context Protocol) server library for Erlang"
HOMEPAGE="https://github.com/barrel-platform/barrel_mcp"
SRC_URI="https://github.com/barrel-platform/barrel_mcp/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"
S="${WORKDIR}/barrel_mcp-${PV}"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	dev-erlang/h1
	dev-erlang/h2
	dev-erlang/hackney
"

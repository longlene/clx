# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit rebar3

DESCRIPTION="High-performance HTTP/1.1, HTTP/2, HTTP/3 server for Erlang/OTP"
HOMEPAGE="https://github.com/benoitc/livery"
SRC_URI="https://github.com/benoitc/livery/archive/refs/tags/v${PV}.tar.gz
	-> ${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	dev-erlang/barrel-mcp
	dev-erlang/h1
	dev-erlang/h2
	dev-erlang/instrument
	dev-erlang/mimerl
	dev-erlang/quic
	dev-erlang/webtransport
	dev-erlang/ws
"

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
	>=dev-erlang/barrel-mcp-2.2.4
	>=dev-erlang/hackney-4.4.2
	>=dev-erlang/h1-0.7.0
	>=dev-erlang/h2-0.10.2
	>=dev-erlang/instrument-1.1.4
	>=dev-erlang/mimerl-1.5.0
	>=dev-erlang/quic-1.6.5
	>=dev-erlang/webtransport-0.4.1
	>=dev-erlang/ws-0.3.0
"

src_prepare() {
	rebar3_src_prepare
	sed -i 's/warnings_as_errors,\?//' rebar.config || die
}

src_install() {
	rebar3_src_install
	local dest="$(get_erl_libs)/${P}"
	insinto "${dest}/include"
	doins "${S}"/include/*.hrl
}

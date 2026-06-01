# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit rebar3

DESCRIPTION="Simple HTTP client with HTTP/1.1, HTTP/2, and HTTP/3 support"
HOMEPAGE="https://github.com/benoitc/hackney"
SRC_URI="https://github.com/benoitc/hackney/archive/refs/tags/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	dev-erlang/certifi
	dev-erlang/h2
	dev-erlang/idna
	dev-erlang/mimerl
	dev-erlang/parse_trans
	dev-erlang/quic
	dev-erlang/ssl_verify_fun
"
DEPEND="${RDEPEND}"

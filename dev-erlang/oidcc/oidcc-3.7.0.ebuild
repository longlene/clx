# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit rebar3

DESCRIPTION="OpenId Connect client library in Erlang & Elixir"
HOMEPAGE="https://github.com/erlef/oidcc"
SRC_URI="https://github.com/erlef/oidcc/archive/refs/tags/v${PV}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

DEPEND="
	>=dev-erlang/jose-1.11.0
"
RDEPEND="${DEPEND}
	>=dev-erlang/telemetry-1.2.0
	>=dev-erlang/telemetry_registry-0.3.1
	>=dev-erlang/jose-1.11.0
"
BDEPEND=""

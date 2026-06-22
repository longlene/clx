# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit rebar3

DESCRIPTION="Generic GraphQL HTTP and WebSocket transports for Cowboy"
HOMEPAGE="https://github.com/seriyps/cowboy_graphql"
SRC_URI="https://github.com/seriyps/cowboy_graphql/archive/refs/tags/${PV}.tar.gz -> ${P}.gh.tar.gz"

S="${WORKDIR}/cowboy_graphql-${PV}"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND=">=dev-erlang/cowboy-2.9.0"

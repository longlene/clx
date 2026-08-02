# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit rebar3

DESCRIPTION="A Raft-based lock server for the Erlang ecosystem"
HOMEPAGE="https://github.com/rabbitmq/portunus"
SRC_URI="https://github.com/rabbitmq/portunus/archive/refs/tags/v${PV}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="|| ( Apache-2.0 MPL-2.0 )"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	dev-erlang/ra
	dev-erlang/seshat
"

# Copyright 2023 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit rebar3

DESCRIPTION="A Raft implementation for Erlang and Elixir"
HOMEPAGE="https://github.com/rabbitmq/ra"
SRC_URI="https://github.com/rabbitmq/ra/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="
	dev-erlang/aten
	dev-erlang/gen_batch_server
	dev-erlang/seshat
"
RDEPEND="${DEPEND}"
BDEPEND=""

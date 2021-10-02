# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit rebar

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
"
RDEPEND="${DEPEND}"
BDEPEND=""

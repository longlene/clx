# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit rebar vcs-snapshot

DESCRIPTION="A generic batching server for Erlang and Elixir"
HOMEPAGE="https://github.com/rabbitmq/gen-batch-server"
SRC_URI="https://github.com/rabbitmq/gen-batch-server/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

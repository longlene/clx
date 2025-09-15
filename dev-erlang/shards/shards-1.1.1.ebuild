# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit rebar3

DESCRIPTION="Transparent and out-of-box Sharding support for Erlang/Elixir ETS tables"
HOMEPAGE="https://github.com/cabol/shards"
SRC_URI="https://github.com/cabol/shards/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

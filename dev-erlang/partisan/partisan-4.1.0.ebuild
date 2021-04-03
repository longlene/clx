# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit rebar

DESCRIPTION="High-performance, high-scalability distributed computing with Erlang and Elixir"
HOMEPAGE="https://github.com/lasp-lang/partisan"
SRC_URI="https://github.com/lasp-lang/partisan/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-erlang/uuid_erl
	dev-erlang/time_compat
	dev-erlang/rand_compat
	>=dev-erlang/acceptor_pool-1.0.0
	>=dev-erlang/types-0.1
	>=dev-erlang/lager-3.5
"
BDEPEND=""

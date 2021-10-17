# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

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
	>=dev-erlang/acceptor_pool-1.0.0
	dev-erlang/goldrush
	dev-erlang/lager
	dev-erlang/quickrand
	>=dev-erlang/types-0.1
	dev-erlang/uuid_erl
"
BDEPEND=""

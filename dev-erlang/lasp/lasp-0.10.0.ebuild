# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit rebar

DESCRIPTION="Prototype implementation of Lasp in Erlang"
HOMEPAGE="http://lasp-lang.org/"
SRC_URI="https://github.com/lasp-lang/lasp/archive/refs/tags/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND=""
RDEPEND="${DEPEND}
	dev-erlang/acceptor_pool
	dev-erlang/gen_flow
	dev-erlang/gen_fsm_compat
	dev-erlang/goldrush
	dev-erlang/lager
	dev-erlang/lasp_support
	dev-erlang/partisan
	dev-erlang/plumtree
	dev-erlang/quickrand
	dev-erlang/time_compat
	dev-erlang/types
	dev-erlang/uuid_erl
"
BDEPEND=""

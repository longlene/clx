# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="Distributed systems infrastructure used by Riak"
HOMEPAGE="https://github.com/basho/riak_core"
SRC_URI="https://github.com/basho/riak_core/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="
	>=dev-erlang/lager-3.2.4
	>=dev-erlang/poolboy-0.8.1
	>=dev-erlang/basho_stats-1.0.3
	>=dev-erlang/riak_sysmon-2.1.5
	>=dev-erlang/eleveldb-2.0.34
	>=dev-erlang/riak_ensemble-2.1.8
	>=dev-erlang/pbkdf2-2.0.0
	>=dev-erlang/exometer_core-1.0.0
	>=dev-erlang/clique-0.3.9
"
RDEPEND="${DEPEND}"
BDEPEND=""

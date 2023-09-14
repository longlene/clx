# Copyright 2023 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit rebar vcs-snapshot

DESCRIPTION="Erlang LevelDB API"
HOMEPAGE="https://github.com/basho/eleveldb"
SRC_URI="https://github.com/basho/eleveldb/archive/refs/tags/riak_kv-${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""


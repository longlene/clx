# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit rebar3

REBAR_APP_SRC="src/barrel_docdb.app.src"

DESCRIPTION="Document database with MVCC, real-time subscriptions, and P2P replication"
HOMEPAGE="https://github.com/barrel-db/barrel_docdb"
SRC_URI="https://github.com/barrel-db/barrel_docdb/archive/refs/tags/v${PV}.tar.gz
	-> ${P}.gh.tar.gz"
S="${WORKDIR}/barrel_docdb-${PV}"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	dev-erlang/cowboy
	dev-erlang/hackney
	dev-erlang/hlc
	dev-erlang/jose
	dev-erlang/match_trie
	dev-erlang/mimerl
	dev-erlang/prometheus
	dev-erlang/rocksdb
"

src_prepare() {
	sed -i 's/warnings_as_errors,//' rebar.config || die
	rebar3_src_prepare
}

src_install() {
	rebar3_src_install
	local dest
	dest="$(get_erl_libs)/${P}"
	insinto "${dest}/include"
	doins include/*.hrl
}

# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit rebar3

# The app is named barrel_docdb (underscore), PN has a hyphen.
REBAR_APP_SRC="src/barrel_docdb.app.src"

DESCRIPTION="Erlang document database with MVCC, queries, and replication"
HOMEPAGE="https://github.com/barrel-db/barrel
	https://docs.barrel-db.eu/docdb"
SRC_URI="https://repo.hex.pm/tarballs/barrel_docdb-${PV}.tar"
S="${WORKDIR}"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~arm64"

RDEPEND="
	>=dev-erlang/barrel-crypto-1.0.0
	dev-erlang/hackney
	dev-erlang/hlc
	dev-erlang/instrument
	dev-erlang/match_trie
	dev-erlang/mimerl
	dev-erlang/rocksdb
"

src_unpack() {
	# Hex tarballs wrap the app source in contents.tar.gz.
	unpack "${A}"
	tar -xzf contents.tar.gz || die
}

src_prepare() {
	sed -i 's/warnings_as_errors,//' rebar.config || die
	rebar3_src_prepare
}

src_install() {
	# rebar3_src_install looks for _build/default/lib/${PN}; the app
	# directory is named barrel_docdb.
	pushd "_build/default" || die
	ln -s barrel_docdb "lib/${PN}" || die
	popd
	rebar3_src_install

	local dest
	dest="$(get_erl_libs)/${P}"
	insinto "${dest}/include"
	doins include/*.hrl
}

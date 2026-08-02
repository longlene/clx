# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit rebar3

COMMIT="52823a9c2f95c5645830f273a65aae02844255c5"
REBAR_APP_SRC="src/barrel_vectordb.app.src"

DESCRIPTION="Embedded vector database with pluggable backends and RocksDB"
HOMEPAGE="https://github.com/barrel-db/barrel_vectordb"
SRC_URI="https://github.com/barrel-db/barrel_vectordb/archive/${COMMIT}.tar.gz
	-> ${P}.gh.tar.gz"
S="${WORKDIR}/barrel_vectordb-${COMMIT}"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	dev-erlang/barrel-embed
	dev-erlang/gen-batch-server
	dev-erlang/hackney
	dev-erlang/iommap
	dev-erlang/rocksdb
"
BDEPEND="dev-build/cmake"

src_prepare() {
	perl -i -0pe 's/,\s*\n\s*warnings_as_errors//g' rebar.config || die
	rebar3_src_prepare
}

src_compile() {
	erebar3 compile
}

src_install() {
	pushd "_build/default" || die
	rebar3_install_lib lib/barrel_vectordb
	popd || die

	local dest
	dest="$(get_erl_libs)/${P}"
	insinto "${dest}/priv"
	doins "${S}"/priv/barrel_vectordb_nif.so
	insinto "${dest}/include"
	doins "${S}"/include/barrel_vectordb.hrl

	einstalldocs
}

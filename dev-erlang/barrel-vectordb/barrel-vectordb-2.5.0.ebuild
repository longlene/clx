# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit rebar3

# The app is named barrel_vectordb (underscore), PN has a hyphen.
REBAR_APP_SRC="src/barrel_vectordb.app.src"

DESCRIPTION="Erlang vector database with pluggable backends and RocksDB"
HOMEPAGE="https://github.com/barrel-db/barrel"
SRC_URI="https://repo.hex.pm/tarballs/barrel_vectordb-${PV}.tar"
S="${WORKDIR}"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~arm64"

RDEPEND="
	>=dev-lang/erlang-26
	>=dev-erlang/barrel-crypto-1.0.0
	>=dev-erlang/barrel-embed-2.3.0
	dev-erlang/hackney
	dev-erlang/iommap
	dev-erlang/rocksdb
"
BDEPEND="
	dev-build/cmake
"

src_unpack() {
	# Hex tarballs wrap the app source in contents.tar.gz.
	unpack "${A}"
	tar -xzf contents.tar.gz || die
}

src_prepare() {
	perl -i -0pe 's/,\s*\n\s*warnings_as_errors//g' rebar.config || die
	rebar3_src_prepare
}

src_compile() {
	# The CMake NIF build is driven by rebar3 pre/post hooks attached to
	# the 'compile' task (do_cmake.sh + cmake --build), so invoke compile
	# directly rather than the eclass default 'release' target.
	erebar3 compile
}

src_install() {
	# rebar3_src_install looks for _build/default/lib/${PN}; the app
	# directory is named barrel_vectordb.
	pushd "_build/default" || die
	ln -s barrel_vectordb "lib/${PN}" || die
	popd
	rebar3_src_install

	local dest
	dest="$(get_erl_libs)/${P}"
	# The NIF is built into the source priv/ by the cmake post-hook.
	insinto "${dest}/priv"
	doins "${S}"/priv/barrel_vectordb_nif.so
	insinto "${dest}/include"
	doins "${S}"/include/barrel_vectordb.hrl
}

# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit rebar3

REBAR_APP_SRC="src/barrel_faiss.app.src"

DESCRIPTION="Erlang NIF bindings for FAISS vector similarity search"
HOMEPAGE="https://github.com/barrel-db/barrel_faiss"
SRC_URI="https://github.com/barrel-db/barrel_faiss/archive/refs/tags/${PV}.tar.gz
	-> ${P}.gh.tar.gz"
S="${WORKDIR}/barrel_faiss-${PV}"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="sci-ml/faiss"
BDEPEND="dev-build/cmake"

src_install() {
	rebar3_src_install
	# priv/ in _build/ is a symlink — install NIF manually
	local dest
	dest="$(get_erl_libs)/${P}"
	insinto "${dest}/priv"
	doins "${S}"/priv/*.so
}

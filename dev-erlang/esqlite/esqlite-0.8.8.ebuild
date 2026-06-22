# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit rebar3

DESCRIPTION="Erlang NIF for sqlite"
HOMEPAGE="https://github.com/mmzeeman/esqlite"
SRC_URI="https://github.com/mmzeeman/esqlite/archive/refs/tags/${PV}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

DEPEND="dev-db/sqlite:3"
RDEPEND="${DEPEND}"

src_prepare() {
	# Package uses rebar.config.script — no rebar.config to patch.
	# Remove the lock file so rebar3 does not try to fetch locked versions.
	rm -f rebar.lock || die
	eapply_user
}

src_compile() {
	ESQLITE_USE_SYSTEM=1 rebar3 compile || die
}

src_install() {
	rebar3_src_install
	local dest="$(get_erl_libs)/${P}"
	insinto "${dest}/priv"
	doins "${S}"/priv/esqlite3_nif.so
}

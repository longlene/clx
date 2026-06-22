# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

REBAR_APP_SRC="src/barrel_embed.app.src"

inherit rebar3

DESCRIPTION="Lightweight embedding generation for Erlang/Elixir applications"
HOMEPAGE="https://github.com/barrel-db/barrel_embed"
SRC_URI="https://github.com/barrel-db/barrel_embed/archive/refs/tags/v${PV}.tar.gz
	-> erlang_${P}.gh.tar.gz"

S="${WORKDIR}/barrel_embed-${PV}"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="dev-erlang/hackney"

src_install() {
	# rebar3 builds to lib/barrel_embed (underscore) but PN uses hyphen
	pushd "_build/${REBAR_PROFILE}" >/dev/null || die
	rebar3_install_lib lib/barrel_embed
	popd >/dev/null || die

	# priv/ in _build/ is a symlink; install the Python port server manually
	local dest
	dest="$(get_erl_libs)/${P}"
	insinto "${dest}/priv"
	doins -r "${S}"/priv/.

	einstalldocs
}

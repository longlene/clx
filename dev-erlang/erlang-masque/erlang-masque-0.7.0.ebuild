# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit rebar3

DESCRIPTION="MASQUE (RFC 9298/9484) UDP/TCP/IP proxy over HTTP/3, HTTP/2, HTTP/1.1"
HOMEPAGE="https://github.com/benoitc/erlang_masque"
SRC_URI="https://github.com/benoitc/erlang_masque/archive/refs/tags/v${PV}.tar.gz
	-> ${P}.gh.tar.gz"
S="${WORKDIR}/erlang_masque-${PV}"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

REBAR_APP_SRC="src/masque.app.src"

RDEPEND="
	>=dev-erlang/hackney-4.3.0
	>=dev-erlang/h1-0.6.2
	>=dev-erlang/h2-0.9.0
	>=dev-erlang/instrument-1.1.3
	>=dev-erlang/quic-1.3.0
"

src_prepare() {
	rebar3_src_prepare
	sed -i -e 's/,\s*warnings_as_errors//' -e 's/warnings_as_errors,\s*//' rebar.config || die
}

src_install() {
	pushd "_build/${REBAR_PROFILE}" >/dev/null || die
	rebar3_install_lib lib/masque
	popd >/dev/null || die
	local dest="$(get_erl_libs)/${P}"
	insinto "${dest}/include"
	doins "${S}"/include/*.hrl
	einstalldocs
}

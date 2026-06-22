# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit rebar3

REBAR_APP_SRC="src/lexbor_erl.app.src"

DESCRIPTION="Fast HTML5 parser via Lexbor C library, using Erlang port interface"
HOMEPAGE="https://github.com/f34nk/lexbor_erl"
SRC_URI="https://github.com/f34nk/lexbor_erl/archive/refs/tags/v${PV}.tar.gz -> ${P}.gh.tar.gz"

S="${WORKDIR}/lexbor_erl-${PV}"

LICENSE="LGPL-2.1+"
SLOT="0"
KEYWORDS="~amd64"

DEPEND="dev-libs/lexbor"
RDEPEND="${DEPEND}"
BDEPEND="dev-build/cmake"

src_install() {
	rebar3_src_install
	local dest="$(get_erl_libs)/${P}"
	insinto "${dest}/priv"
	doins "${S}"/priv/lexbor_port
	fperms 0755 "${dest}/priv/lexbor_port"
}

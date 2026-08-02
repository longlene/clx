# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit rebar3

DESCRIPTION="Hybrid Logical Clock in Erlang"
HOMEPAGE="https://github.com/barrel-db/hlc"
SRC_URI="https://github.com/barrel-db/hlc/archive/refs/tags/v${PV}.tar.gz
	-> ${P}.gh.tar.gz"

LICENSE="MPL-2.0"
SLOT="0"
KEYWORDS="~amd64"

src_install() {
	rebar3_src_install
	local dest
	dest="$(get_erl_libs)/${P}"
	insinto "${dest}/include"
	doins include/*.hrl
}

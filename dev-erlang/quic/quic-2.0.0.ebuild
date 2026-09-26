# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit rebar3

DESCRIPTION="Pure Erlang QUIC implementation (RFC 9000/9001)"
HOMEPAGE="https://github.com/benoitc/erlang_quic"
SRC_URI="https://github.com/benoitc/erlang_quic/archive/refs/tags/${PV}.tar.gz
	-> erlang_${P}.gh.tar.gz"
S="${WORKDIR}/erlang_quic-${PV}"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~arm64"

DOCS=( README.md CHANGELOG.md )

src_install() {
	rebar3_src_install
	# include/ and priv/ in _build/ are symlinks, skipped by the eclass
	local dest="$(get_erl_libs)/${P}"
	insinto "${dest}/include"
	doins "${S}"/include/*.hrl
	insinto "${dest}/priv"
	doins -r "${S}"/priv/bin
}

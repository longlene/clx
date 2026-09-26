# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit rebar3

DESCRIPTION="Web framework for the BEAM — Erlang, Elixir, and LFE"
HOMEPAGE="http://www.novaframework.org https://github.com/novaframework/nova"
SRC_URI="https://github.com/novaframework/nova/archive/refs/tags/v${PV}.tar.gz
	-> ${P}.gh.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~arm64"

RDEPEND="
	>=dev-erlang/cowboy-2.18.0
	dev-erlang/erlydtl
	>=dev-erlang/jhn_stdlib-5.11.2
	>=dev-erlang/thoas-1.2.1
"

src_install() {
	rebar3_src_install
	# include/ and priv/ in the build tree are symlinks and skipped
	# by the eclass; install headers and the static favicon from source.
	local dest
	dest="$(get_erl_libs)/${P}"
	insinto "${dest}/include"
	doins include/*.hrl
	insinto "${dest}/priv/static"
	doins priv/static/nova.png
}

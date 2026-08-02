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
KEYWORDS="~amd64"

RDEPEND="
	>=dev-erlang/cowboy-2.15.0
	dev-erlang/erlydtl
	>=dev-erlang/jhn_stdlib-5.11.2
	dev-erlang/routing-tree
	>=dev-erlang/thoas-1.2.1
"

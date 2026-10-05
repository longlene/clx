# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit rebar3

DESCRIPTION="Erlang SDK for a file-backed JSON token engine"
HOMEPAGE="https://github.com/crudjt/crudjt_erlang"
SRC_URI="https://github.com/crudjt/crudjt_erlang/archive/refs/tags/v${PV}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="MIT Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	dev-elixir/crudjt
	dev-elixir/flow
	dev-elixir/gen_stage
	dev-elixir/googleapis
	dev-elixir/grpc
	dev-elixir/msgpax
	dev-elixir/protobuf
	dev-elixir/toml
	dev-erlang/cowboy
	dev-erlang/cowlib
	dev-erlang/gun
	dev-erlang/hpax
	dev-erlang/jason
	dev-erlang/mint
	dev-erlang/ranch
	dev-erlang/rustler
	dev-erlang/telemetry
"

src_prepare() {
	# The repo has no Elixir or Rust code - drop the mix/rustler
	# build plugins that would fetch tooling from hex at build time.
	eapply "${FILESDIR}/${P}-no-mix-rustler.patch"
	rebar3_src_prepare
	# Upstream hardcodes a stale version in the app src.
	sed -i -e "s/{vsn, \"0.1.0\"}/{vsn, \"${PV}\"}/" src/${PN}.app.src || die
}

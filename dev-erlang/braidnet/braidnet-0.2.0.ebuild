# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit rebar3

DESCRIPTION="Orchestrator managing Erlang containers and routing Erlang Distribution"
HOMEPAGE="https://github.com/stritzinger/braidnet"
SRC_URI="https://github.com/stritzinger/braidnet/archive/refs/tags/${PV}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	dev-erlang/cowboy
	dev-erlang/jiffy
	dev-erlang/uuid
"

src_prepare() {
	rebar3_src_prepare
	# rebar3_docker is a Docker release plugin; not needed for library build,
	# and it fetches from git at startup which breaks network sandbox.
	sed -i '/^{plugins,/,/^\]}\./d' "${S}/rebar.config" || die
}

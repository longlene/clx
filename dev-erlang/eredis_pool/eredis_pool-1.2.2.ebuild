# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit rebar3

DESCRIPTION="Erlang pool for Redis with consistent hashing support"
HOMEPAGE="https://github.com/silviucpp/eredis_pool"
SRC_URI="https://github.com/silviucpp/eredis_pool/archive/refs/tags/v${PV}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	dev-erlang/dynamic_compile
	dev-erlang/eredis
	dev-erlang/erl_hash
	dev-erlang/erlpool
	dev-erlang/jchash
"

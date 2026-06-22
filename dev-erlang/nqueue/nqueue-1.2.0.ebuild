# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit rebar3

DESCRIPTION="Erlang library to spawn/manage queues based on ETS public tables"
HOMEPAGE="https://github.com/nomasystems/nqueue"
SRC_URI="https://github.com/nomasystems/nqueue/archive/refs/tags/${PV}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	dev-erlang/nhooks
	dev-erlang/nthrottle
"

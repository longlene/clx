# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit rebar

DESCRIPTION="Native Erlang CQL client for Cassandra"
HOMEPAGE="https://github.com/cqerl/cqerl"
SRC_URI="https://github.com/cqerl/cqerl/archive/v2.0.1.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND="
	dev-erlang/lz4
	dev-erlang/quickrand
	dev-erlang/re2
	dev-erlang/semver_erl
	dev-erlang/snappyer
	dev-erlang/uuid_erl
"
RDEPEND="${DEPEND}"
BDEPEND=""

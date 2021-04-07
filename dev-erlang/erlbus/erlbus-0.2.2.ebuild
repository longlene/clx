# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit rebar

DESCRIPTION="Simple, Distributed and Scalable PubSub Message Bus written in Erlang"
HOMEPAGE="https://github.com/cabol/erlbus"
SRC_URI="https://github.com/cabol/erlbus/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND=""
RDEPEND="${DEPEND}
	dev-erlang/shards
"
BDEPEND=""

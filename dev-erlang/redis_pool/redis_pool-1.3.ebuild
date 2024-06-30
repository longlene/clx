# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit rebar3

DESCRIPTION="A high performant Erlang pool for eredis based on erlpool"
HOMEPAGE="https://github.com/silviucpp/redis_pool"
SRC_URI="https://github.com/silviucpp/redis_pool/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-erlang/eredis
	>=dev-erlang/erlpool-1.2
"
BDEPEND=""

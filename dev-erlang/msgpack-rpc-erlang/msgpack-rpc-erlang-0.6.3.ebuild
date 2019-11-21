# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit rebar

DESCRIPTION="RPC with MessagePack in Erlang/OTP"
HOMEPAGE="https://github.com/msgpack-rpc/msgpack-rpc-erlang"
SRC_URI="https://github.com/msgpack-rpc/msgpack-rpc-erlang/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="
	>=dev-erlang/msgpack-0.2.3
	>=dev-erlang/ranch-1.0.0
	dev-erlang/proper
"
RDEPEND="${DEPEND}"
BDEPEND=""

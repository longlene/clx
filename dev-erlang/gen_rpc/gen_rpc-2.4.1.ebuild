# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit rebar3

DESCRIPTION="A scalable RPC library for Erlang-VM based languages"
HOMEPAGE="https://github.com/fastdgiot/gen_rpc"
SRC_URI="https://github.com/fastdgiot/gen_rpc/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	>=dev-erlang/hut-1.2
	>=dev-erlang/ssl_verify_fun-1.1
"
BDEPEND=""

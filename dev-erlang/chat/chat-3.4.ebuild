# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit rebar3

DESCRIPTION="Messaging Protocol"
HOMEPAGE="https://github.com/synrc/chat"
SRC_URI="https://github.com/synrc/chat/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-erlang/active
	dev-erlang/cowboy
	dev-erlang/rocksdb
	>=dev-erlang/syn-1.5.0
	dev-erlang/kvx
	dev-erlang/n2o
"
BDEPEND=""

# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit rebar3

DESCRIPTION="Erlang implementation of HyperLogLog"
HOMEPAGE="https://github.com/basho/hyper"
SRC_URI="https://github.com/basho/hyper/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND="
	dev-erlang/bisect
"
RDEPEND="${DEPEND}"
BDEPEND=""

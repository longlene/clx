# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit rebar

DESCRIPTION="CLI Framework for Erlang"
HOMEPAGE="https://github.com/basho/clique"
SRC_URI="https://github.com/basho/clique/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-erlang/cuttlefish
"
BDEPEND=""

src_prepare() {
	default
	sed -i 's#erlang:get_stacktrace()#[]#' src/clique_test_group_leader.erl
}

# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit rebar3

DESCRIPTION="simple persistent queues for Erlang"
HOMEPAGE="https://github.com/fogfish/esq"
SRC_URI="https://github.com/fogfish/esq/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-erlang/datum
	dev-erlang/pipe
	dev-erlang/uid
"
BDEPEND=""

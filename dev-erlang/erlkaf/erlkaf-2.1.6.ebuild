# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit rebar3

DESCRIPTION="Erlang kafka driver based on librdkafka"
HOMEPAGE="https://github.com/silviucpp/erlkaf"
SRC_URI="https://github.com/silviucpp/erlkaf/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	>=dev-erlang/lager-3.6.6
	>=dev-erlang/jsone-1.4.7
	>=dev-erlang/plists-1.1.2
	>=dev-erlang/esq-2.0.4
"
BDEPEND=""

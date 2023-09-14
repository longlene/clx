# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit rebar

DESCRIPTION="A high performant Erlang NIF Priority Queue implemented using a binary heap"
HOMEPAGE="https://github.com/silviucpp/epqueue"
SRC_URI="https://github.com/silviucpp/epqueue/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

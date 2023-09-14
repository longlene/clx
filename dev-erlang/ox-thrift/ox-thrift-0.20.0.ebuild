# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit rebar

DESCRIPTION="Erlang Thrift encoder/decoder library optimized for efficiency"
HOMEPAGE="https://github.com/openx/ox-thrift"
SRC_URI="https://github.com/openx/ox-thrift/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="
	dev-erlang/ranch
"
RDEPEND="${DEPEND}"
BDEPEND=""

# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit rebar

DESCRIPTION="Generic Erlang CoAP Client/Server"
HOMEPAGE="https://github.com/gotthardp/gen_coap"
SRC_URI="https://github.com/gotthardp/gen_coap/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MPL"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

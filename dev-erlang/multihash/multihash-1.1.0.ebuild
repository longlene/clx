# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit rebar

DESCRIPTION="Erlang implementation of multihash"
HOMEPAGE="https://github.com/helium/erlang-multihash"
SRC_URI="https://github.com/helium/erlang-multihash/archive/v${PV}.tar.gz -> erlang-${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

S="${WORKDIR}/erlang-${P}"

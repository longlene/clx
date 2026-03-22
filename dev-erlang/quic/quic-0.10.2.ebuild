# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit rebar3

DESCRIPTION="Pure Erlang QUIC implementation"
HOMEPAGE="https://github.com/benoitc/erlang_quic"
SRC_URI="https://github.com/benoitc/erlang_quic/archive/refs/tags/v${PV}.tar.gz -> erlang_${P}.gh.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

S="${WORKDIR}"/erlang_quic-${PV}

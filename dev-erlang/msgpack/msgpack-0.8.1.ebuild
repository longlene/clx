# Copyright 2023 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit rebar3

DESCRIPTION="MessagePack (de)serializer implementation for Erlang"
HOMEPAGE="http://msgpack.org/"
SRC_URI="https://github.com/msgpack/msgpack-erlang/archive/refs/tags/${PV}.tar.gz -> ${PN}-erlang-${PV}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=">=dev-lang/erlang-17.0"
RDEPEND="${DEPEND}"
BDEPEND=""

S="${WORKDIR}"/msgpack-erlang-${PV}

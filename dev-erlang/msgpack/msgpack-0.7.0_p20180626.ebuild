# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit rebar vcs-snapshot

EGIT_COMMIT="f1e1b98a5fc5fa8ea72bff834f145c7d0854c027"

DESCRIPTION="MessagePack (de)serializer implementation for Erlang"
HOMEPAGE="http://msgpack.org/"
SRC_URI="https://github.com/msgpack/msgpack-erlang/archive/${EGIT_COMMIT}.tar.gz -> ${PN}-erlang-${PV}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=">=dev-lang/erlang-17.0"
RDEPEND="${DEPEND}"
BDEPEND=""

S="${WORKDIR}"/msgpack-erlang-${PV}

# Copyright 2004-2007 BreakMyGentoo.net
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit multilib subversion

ESVN_REPO_URI="https://svn.process-one.net/ejabberd-modules/pgsql/trunk"
ESVN_PROJECT="${PN}"

DESCRIPTION="Native Postgres driver for erlang"
HOMEPAGE="http://process-one.net"

LICENSE=""
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

DEPEND=">=dev-lang/erlang-13.2.1"
RDEPEND="${DEPEND}"

src_compile() {
	./build.sh
}

src_install() {
	local ERL_LIBDIR=/usr/$(get_libdir)/erlang/lib

	dodir ${ERL_LIBDIR}/postgres/ebin
	insinto ${ERL_LIBDIR}/postgres/ebin
	doins ebin/*.beam

	dodir ${ERL_LIBDIR}/postgres/src
	insinto ${ERL_LIBDIR}/postgres/src
	doins src/*.erl
}

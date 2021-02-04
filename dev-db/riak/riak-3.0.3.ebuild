# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit versionator eutils user multilib toolchain-funcs vcs-snapshot

DESCRIPTION="An open source, distributed database"
HOMEPAGE="https://riak.com/"
SRC_URI="https://github.com/basho/riak/archive/${P}.tar.gz -> ${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
#KEYWORDS="~amd64 ~x86"
IUSE="doc"

RDEPEND="
	dev-libs/openssl
	sys-libs/ncurses
	sys-libs/zlib
"
DEPEND="
	>=dev-lang/erlang-20.0
	${RDEPEND}
"

RESTRICT=network-sandbox

#pkg_setup() {
#	ebegin "Creating riak user and group"
#	local riak_home="/var/$(get_libdir)/riak"
#	enewgroup riak
#	enewuser riak -1 -1 $riak_home riak
#	eend $?
#}

src_prepare() {
	default
	sed -i '/warnings_as_errors/d' rebar.config
	./rebar3 get-deps || die "prepare failed"
	sed -i '/warnings_as_errors/d' _build/default/lib/pbkdf2/rebar.config
	sed -i 's/warnings_as_errors,//' _build/default/lib/riak_kv/rebar.config
}

src_compile() {
	./rebar3 as rel release
}

src_install() {
	local libdir=/usr/$(get_libdir)

	insinto ${libdir}
	doins -r _build/rel/rel/riak

	dosym ${libdir}/riak/etc /etc/riak

	# create neccessary directories
	keepdir /var/lib/riak/{bitcask,ring,leveldb} /var/log/riak/sasl

	# change owner to riak
	fowners -R riak:riak /var/lib/riak /var/log/riak

	# create doc
	doman doc/man/man1/*
	use doc && dodoc doc/*.txt

	for x in riak riak-admin riak-debug riak-repl ; do
		dosym ${libdir}/riak/bin/${x} /usr/bin/${x}
	done

	# init.d file
	newinitd "${FILESDIR}/${PN}.initd" riak
	newconfd "${FILESDIR}/${PN}.confd" riak
}


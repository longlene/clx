# Copyright 2018 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit vcs-snapshot

DESCRIPTION="MongooseIM is a mobile messaging platform with focus on performance and scalability"
HOMEPAGE="https://github.com/esl/MongooseIM"
SRC_URI="https://github.com/esl/MongooseIM/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="mysql odbc postgres +redis riak jingle cassandra elasticsearch aws"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

my_use_with() {
	if [ -z "$1" ]; then
		echo "!!! use_with() called without a parameter." >&2
		echo "!!! use_with <USEFLAG> [<flagname> [value]]" >&2
		return 1
	fi

	if ___eapi_use_enable_and_use_with_support_empty_third_argument; then
		local UW_SUFFIX=${3+=$3}
	else
		local UW_SUFFIX=${3:+=$3}
	fi
	local UWORD=${2:-$1}

	if use $1; then
		echo "with-${UWORD}${UW_SUFFIX}"
	else
		echo "without-${UWORD}"
	fi
	return 0
}

src_prepare() {
	default
	use odbc || sed -i '/odbc/d' rebar.config
}

src_configure() {
	./tools/configure \
		$(my_use_with mysql) \
		$(my_use_with odbc) \
		$(my_use_with postgres pgsql) \
		$(my_use_with redis) \
		$(my_use_with riak) \
		$(my_use_with jingle jingle-sip) \
		$(my_use_with cassandra) \
		$(my_use_with elasticsearch) \
		$(my_use_with aws) \
		prefix="" \
		system=true \
		user=jabber || die "configure failed"
	# $(my_use_with amqp amqp_client)
}

src_install() {
	insinto /etc/mongooseim
	doins _build/prod/rel/mongooseim/etc/{app.config,mongooseim.cfg,vm.args,vm.dist.args}
	dobin _build/prod/rel/mongooseim/bin/mongooseimctl
	insinto /usr/lib/mongooseim
	doins -r _build/prod/rel/mongooseim/*
	keepdir /var/lib/mongooseim
	keepdir /var/log/mongooseim
	dodoc README.md
}


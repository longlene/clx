# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit user

DESCRIPTION="A fast NoSQL database, an alternative to Redis"
HOMEPAGE="http://ssdb.io"
SRC_URI="https://github.com/ideawu/ssdb/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD-2"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

pkg_setup() {
	enewgroup ssdb 75
	enewuser ssdb 75 -1 /var/lib/ssdb ssdb
}

src_prepare() {
	epatch \
	"${FILESDIR}"/${PN}-1.9.4-config.patch
	eapply_user
}

src_install() {
	insinto /etc
	doins ssdb.conf ssdb_slave.conf
	use prefix || fowners ssdb:ssdb /etc/ssdb.conf
	fperms 0644 /etc/ssdb.conf

	insinto /usr/include
	doins src/client/SSDB_client.h
	dolib.a src/client/libssdb-client.a

	#insinto /usr/include/ssdb
	#doins src/ssdb/{const.h,binlog.h,iterator.h,options.h,ssdb.h,ttl.h}
	#dolib.a src/ssdb/libssdb.a

	#insinto /usr/include/util
	#doins src/util/{config.h,bytes.h,strings.h}
	#dolib.a src/util/libutil.a

	newconfd "${FILESDIR}/ssdb.confd" ssdb
	newinitd "${FILESDIR}/ssdb.initd" ssdb

	dosbin ssdb-server tools/ssdb-{bench,dump,migrate,repair} tools/leveldb-import

	insinto /usr/$(get_libdir)/ssdb/tools
	doins -r tools/ssdb-cli{,.cpy} tools/ssdb_cli

	insinto /usr/$(get_libdir)/ssdb/deps
	doins -r deps/cpy
	dosym /usr/$(get_libdir)/ssdb/tools/ssdb-cli /usr/bin/ssdb-cli

	dodoc README.md

	keepdir /var/{log,lib}/ssdb
}

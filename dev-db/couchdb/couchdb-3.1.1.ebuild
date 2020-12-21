# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=5

inherit eutils multilib pax-utils user

DESCRIPTION="Distributed, fault-tolerant and schema-free document-oriented database"
HOMEPAGE="https://couchdb.apache.org/"
SRC_URI="mirror://apache/couchdb/source/${PV}/apache-${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~ppc ~x86"
IUSE="libressl selinux test"

RDEPEND=">=dev-libs/icu-4.3.1:=
		<dev-lang/erlang-19[ssl]
		~dev-lang/spidermonkey-1.8.5
		!libressl? ( dev-libs/openssl:0 )
		libressl? ( dev-libs/libressl )
		net-misc/curl
		selinux? ( sec-policy/selinux-couchdb )
		sys-process/psmisc
"

DEPEND="${RDEPEND}
		>=dev-util/rebar-2.6.0
		<dev-util/rebar-3.0.0
		sys-devel/autoconf-archive
"

RESTRICT=test

S="${WORKDIR}/apache-${P}"

pkg_setup() {
	enewgroup couchdb
	enewuser couchdb -1 -1 /var/lib/couchdb couchdb
}

src_configure() {
	econf \
		--with-erlang="${EPREFIX}"/usr/$(get_libdir)/erlang/usr/include \
		--with-curl \
		--user=couchdb
}

src_compile() {
	emake release
}

src_test() {
	emake distcheck
}

src_install() {
	mkdir -p "${D}"/{etc,opt}
	mv "${S}/rel/couchdb/etc" "${D}/etc/couchdb"
	mv "${S}/rel/couchdb" "${D}/opt/"
	dosym ../../etc/couchdb /opt/couchdb/etc

	keepdir /var/l{ib,og}/couchdb

	fowners couchdb:couchdb \
		/var/lib/couchdb \
		/var/log/couchdb

	for f in "${ED}"/etc/couchdb/*.d; do
		fowners root:couchdb "${f#${ED}}"
		fperms 0750 "${f#${ED}}"
	done
	for f in "${ED}"/etc/couchdb/*.ini; do
		fowners root:couchdb "${f#${ED}}"
		fperms 0440 "${f#${ED}}"
	done
	# couchdb needs to write to local.ini on first start
	fowners couchdb:couchdb "/opt/couchdb/etc/local.ini"
	fperms  0640 "/opt/couchdb/etc/local.ini"

	insinto /etc/couchdb/default.d
	insopts -m0640 -oroot -gcouchdb
	doins "${FILESDIR}/10_gentoo.ini"

	insinto /etc/logrotate.d/
	newins "${FILESDIR}/${PN}.logrotate" "${PN}"

	newinitd "${FILESDIR}/${PN}.init-2.1.0" "${PN}"
	newconfd "${FILESDIR}/${PN}.conf-2.1.0" "${PN}"

	rm "${ED}/opt/couchdb/bin/couchdb.cmd"

	# bug 442616
	pax-mark mr "${D}/opt/couchdb/bin/couchjs"
	pax-mark mr "${D}/opt/couchdb/lib/couch-${PV}/priv/couchjs"
}

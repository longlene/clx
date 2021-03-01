# Copyright 2018 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit vcs-snapshot systemd

DESCRIPTION="MongooseIM is a mobile messaging platform with focus on performance and scalability"
HOMEPAGE="https://github.com/esl/MongooseIM"
SRC_URI="https://github.com/esl/MongooseIM/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="systemd"

DEPEND="
	dev-lang/erlang[odbc,ssl]
"
RDEPEND="${DEPEND}"
BDEPEND=""

RESTRICT=network-sandbox

src_configure() {
	./tools/configure with-all without-jingle-sip prefix="" system=true user=jabber || die "configure failed"
}

src_install() {
	insinto /etc/mongooseim
	doins _build/prod/rel/mongooseim/etc/{app.config,mongooseim.cfg,vm.args,vm.dist.args}
	dobin _build/prod/rel/mongooseim/bin/mongooseim{,ctl}
	insinto /usr/lib/mongooseim
	doins -r _build/prod/rel/mongooseim/{lib,priv,releases,erts-*}
	keepdir /var/lib/mongooseim
	keepdir /var/log/mongooseim
	keepdir /var/lock/mongooseim
	dodoc README.md

	newconfd "${FILESDIR}/${PN}.confd" "${PN}"
	newinitd "${FILESDIR}/${PN}.initd" "${PN}"
	if use systemd ; then
		systemd_dounit "${PN}.service"
		systemd_dotmpfilesd "${FILESDIR}/${PN}.tmpfiles.conf"
	fi

	insinto /etc/logrotate.d
	newins "${FILESDIR}/${PN}.logrotate" "${PN}"
}


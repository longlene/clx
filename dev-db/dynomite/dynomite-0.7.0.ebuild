# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit autotools user systemd

DESCRIPTION="A generic dynamo implementation for different k-v storage engines"
HOMEPAGE="https://github.com/Netflix/dynomite"
SRC_URI="https://github.com/Netflix/dynomite/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

AT_NO_RECURSIVE=1

pkg_setup() {
	enewgroup ${PN}
	enewuser ${PN} -1 -1 /var/lib/${PN} ${PN}
}

src_prepare() {
	eapply_user
	eautoreconf
}

src_install() {
	emake install
	insinto /etc/${PN}
	doins conf/dynomite.{pem,yml}
	systemd_dounit "${FILESDIR}/${PN}.service"
	systemd_newtmpfilesd "${FILESDIR}/${PN}.tmpfiles" ${PN}.conf
	newinitd "${FILESDIR}"/${PN}.initd ${PN}
	newconfd "${FILESDIR}"/${PN}.confd ${PN}

	dodir /var/lib/${PN}
	fowners ${PN}:${PN} /var/lib/${PN}
	fperms 755 /var/lib/${PN}
	dodir /var/log/${PN}
	fowners ${PN}:${PN} /var/log/${PN}
	fperms 755 /var/log/${PN}
}

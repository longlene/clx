# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

DESCRIPTION="Libpcap-based packet logger and soft tap"
HOMEPAGE="http://www.snort.org/users/roesch/Site/Daemonlogger/Daemonlogger.html"
SRC_URI="http://www.snort.org/users/roesch/code/${P}.tar.gz"

SLOT="0"
LICENSE="GPL-2"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="dev-libs/libdnet
	net-libs/libpcap"
RDEPEND="${DEPEND}"

pkg_setup() {
	enewgroup daemonlogger
	enewuser daemonlogger -1 /dev/null -1 daemonlogger
}

src_install () {
	emake DESTDIR="${D}" install || die
	dodir /etc/daemonlogger/ /var/log/daemonlogger/ || die
	touch "${D}"/etc/daemonlogger/daemonlogger.bpf || die
	fowners daemonlogger:daemonlogger /etc/daemonlogger/ \
		/etc/daemonlogger/daemonlogger.bpf \
		/var/log/daemonlogger/ || die
	dodoc AUTHORS ChangeLog README || die
	newconfd "${FILESDIR}/daemonlogger.confd.1" daemonlogger || die
	newinitd "${FILESDIR}/daemonlogger.rc.1" daemonlogger || die
}

pkg_postinst() {
	elog "Configuration options can be set in /etc/conf.d/daemonlogger."
}

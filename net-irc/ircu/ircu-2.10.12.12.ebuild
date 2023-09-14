# Copyright 1999-2007 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

inherit flag-o-matic

DESCRIPTION="Undernet IRC Server Development"
HOMEPAGE="http://coder-com.undernet.org/"
SRC_URI="mirror://sourceforge/undernet-ircu/${PN}${PVR}.tar.gz"
S="${WORKDIR}/${PN}${PVR}"

LICENSE="GPL-1"
SLOT="0"
KEYWORDS="~x86 ~amd64"

IUSE="debug"

src_compile() {
        # by more gentle by setting the max connections
        # than the configure script by unternet
        MAXFD=$(ulimit -Sn)
        MAXCON=${IRCD_MAX_CONNECTIONS:-$(($MAXFD-4))}

        if [ -z "${IRCD_MAX_CONNECTIONS}" ]; then
                ewarn "This ircd will allow ${MAXCON} connections."
                ewarn "To change this, set IRCD_MAX_CONNECTIONS in your make.conf."
        fi
          
        econf \
                --with-symlink=ircu-ircd \
                --with-dpath=/etc/ircu \
                --with-cpath=/etc/ircu/ircd.conf \
                --with-lpath=/var/log/ircu/ircu.log \
                --with-maxcon=${MAXCON} \
                $(use_enable debug) \
                || die "econf failed"
        emake || die "emake failed"
}

src_install() {
	newbin ircd/ircd ircu-ircd || die "newbin failed"
	newman doc/ircd.8 ircu-ircd.8 || die "newman failed"

	insinto /etc/ircu
	newins doc/example.conf ircd.conf.sample || die "doins failed"

	newinitd ${FILESDIR}/ircu.init.d ircu || die "newinitd failed"
	newconfd ${FILESDIR}/ircu.conf.d ircu || die "newconfd failed"

	keepdir /var/log/ircu

	dodoc \
		INSTALL* LICENSE README* RELEASE.NOTES doc/readme.* \
		doc/p10.html doc/features.txt doc/Authors \
		|| die "dodoc failed"
}

pkg_postinst() {
	enewuser ircu
	chown ircu ${ROOT}/var/log/ircu

	elog
	elog "A sample config file can be found at /etc/ircu/ircd.conf.sample"
	elog
}

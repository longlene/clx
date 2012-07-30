# Copyright 1999-2005 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit eutils

DESCRIPTION="KiSS PC-Link Daemon"
HOMEPAGE="http://popies.net/kissd/"
SRC_URI="http://popies.net/kissd/${P}.tar.bz2"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86"
IUSE=""
DEPEND=${RDEPEND}

src_unpack() {
	unpack ${A}
	cd ${S}
}

src_compile() {
	emake || die
}

src_install() {
	dodir /etc /usr/bin /usr/sbin /usr/share/man/man1
	dobin kissd-posttrigger
	dobin kissd-pretrigger
	dosbin kissd
	insinto /etc
	doins ${FILESDIR}/kissd.conf
	dodoc CHANGES
	doman kissd.1
	newinitd ${FILESDIR}/kissd.init kissd
}

pkg_postinst() {
	echo
	einfo "Remember to setup your paths in /etc/kissd.conf."
	einfo "To have the kissd server started at boot, type the following:"
	einfo "rc-update add kissd default"
	echo
}
